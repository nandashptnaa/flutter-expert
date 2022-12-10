import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/widgets/tv_card.dart';
import 'package:ditonton/presentation/bloc/tvseries/tv_series_bloc.dart' as tvblloc;
import 'package:ditonton/presentation/bloc/tvseries/tv_series_state.dart' as tvblloc;
import 'package:ditonton/presentation/bloc/tvseries/tv_series_event.dart' as tvblloc;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WatchlistTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist_tv_page';
  const WatchlistTvPage({Key? key}) : super(key: key);

  @override
  State<WatchlistTvPage> createState() => _WatchlistTvPageState();
}

class _WatchlistTvPageState extends State<WatchlistTvPage> with RouteAware {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => {context
          .read<tvblloc.WatchlistTvseriesBloc>()
          .add(tvblloc.FetchTvseriesData())});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {    
    super.didPopNext();
    context
          .read<tvblloc.WatchlistTvseriesBloc>()
          .add(tvblloc.FetchTvseriesData());
  }

  @override
  void dispose() {    
    super.dispose();
    routeObserver.unsubscribe(this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist Tv'),
    ),
    
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<tvblloc.WatchlistTvseriesBloc, tvblloc.TvSeriesState>(
        builder: (context, state) {
          if (state is tvblloc.LoadingTvData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is tvblloc.LoadedTvData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.result[index];
                return TvSeriesCard(tv);
              },
              itemCount: state.result.length,
            );
          } else if (state is tvblloc.ErrorTvData) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),)
    );
  }
}
