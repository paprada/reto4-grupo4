import 'package:crud_local/domain/controller/controlapuntes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControlApuntes ca = Get.find();
  @override
  Widget build(BuildContext context) {
    ca.consultaGral().then((value) => print(ca.listaDetalle));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntos Geograficos guardados'),
      ),
      body: Obx(() => ListView.builder(
          itemCount: ca.listaDetalle?.length ?? 0,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(ca.listaDetalle![i]['detalle']),
              subtitle: Text(
                  'Lon: ${ca.listaDetalle![i]['lon']} - Lat: ${ca.listaDetalle![i]['lat']}'),
              trailing: IconButton(
                  onPressed: () {
                    ca
                        .delApuntes(ca.listaDetalle![i]['id'])
                        .then((value) => ca.consultaGral());
                  },
                  icon: const Icon(Icons.delete)),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/adicionar');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
