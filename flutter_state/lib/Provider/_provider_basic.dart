import 'package:flutter/material.dart';
import 'package:flutter_state/Provider/_counter_ViewModel.dart';
import 'package:provider/provider.dart';



/**
 * 1.创建自己需要共享的数据
 * 2.在应用程序的顶层ChangeNotifierProvider
 * 3.在其它位置使用共享的数据
 *  > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
 *  > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
 *  > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */

void main() {
  runApp(
    ChangeNotifierProvider<JXCounterViewModel>(
      create: (ctx) => JXCounterViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JYHomePage(),
    );
  }
}

class JYHomePage extends StatelessWidget {
  const JYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("状态管理"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HYShowData01(),
              HYShowData02()
            ],
          ),
        ),
        floatingActionButton: Selector<JXCounterViewModel, JXCounterViewModel>(
            selector: (ctx, counterVM) => counterVM,
            shouldRebuild: (prev, next) => false,
            child: const Icon(Icons.add),
            builder: (ctx, counterVM, child) {
              print("Selector - builder");
              return FloatingActionButton(
                child: child,
                onPressed:() {
                  counterVM.counter += 1;
                },
              );
            }
        )
    );
  }
}

class HYShowData01 extends StatelessWidget {
  const HYShowData01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HYShowData01 - bulider");
    int counter = Provider.of<JXCounterViewModel>(context).counter;
    return Container(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: const TextStyle(fontSize: 30)),
    );
  }
}

class HYShowData02 extends StatelessWidget {
  const HYShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HYShowData02 - bulider");
    return Container(
        color: Colors.red,
        child: Consumer<JXCounterViewModel>(
          builder: (ctx, viewModel, child) {
            return Text("当前计数: ${viewModel.counter}", style: const TextStyle(fontSize: 30));
          },
        )
    );
  }
}


