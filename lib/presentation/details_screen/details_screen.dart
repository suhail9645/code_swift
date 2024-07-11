import 'package:code_swift/core/cubit/cubit/vehicle_cubit.dart';

import 'package:code_swift/core/models/vehicle_model.dart';
import 'package:code_swift/manager/color_manager.dart';
import 'package:code_swift/manager/font_manager.dart';
import 'package:code_swift/manager/space_manager.dart';
import 'package:code_swift/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VehicleCubit>(context).getVehicleDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: BlocBuilder<VehicleCubit,VehicleState>(
          builder: (context, state) {
            if(state is VehicleFetchSuccess){
              VehicleModel vehicleModel=state.vehicleModel;
            return ListView(
              children: [
                Text(
                  vehicleModel.name.toString(),
                  style: appFont.f22w600Black,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue.withOpacity(0.7),
                    ),
                    appSpaces.spaceForWidth5,
                    Text(vehicleModel.customState.toString())
                  ],
                ),
                Text('₹ ${vehicleModel.customMinimumPrice}-${vehicleModel.customMaximumPrice}'),
              const  SizedBox(
                    width: 200,
                    child: Text(
                        'In very Good condition')),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          
                          image: NetworkImage(
                            'https://deverpnextgaadi.codeswift.in${vehicleModel.customCoverPhoto}'
                              ))),
                ),
                appSpaces.spaceForHeight10,
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 65,
                          width: 80,
                          decoration:const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.shutterstock.com/image-vector/white-box-truck-cargo-delivery-260nw-2176174231.jpg'))),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          appSpaces.spaceForWidth5,
                      itemCount: 8),
                ),
                appSpaces.spaceForHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      3,
                      (index) {
                        List<String> titles = ['Year', 'Kms Driven', 'GVW'];
                        List<String> values = [
                          vehicleModel.customVehicleMake.toString().split('-').first,
                          vehicleModel.customOdometerReadingInKm.toString(),
                          '${vehicleModel.customUnladenWeightInKgs} kgs'
                        ];
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text(
                                  titles[index],
                                  style: appFont.f16w600Black,
                                ),
                                appSpaces.spaceForHeight10,
                                Text(
                                  values[index],
                                  style: appFont.f18w1000Black
                                      .copyWith(color: appColors.primary),
                                )
                              ],
                            ),
                            appSpaces.spaceForWidth10,
                          ],
                        );
                      },
                    )
                  ],
                ),
                appSpaces.spaceForHeight10,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) {
                          List<String> titles = [
                            'Insurance',
                            'Permit',
                            'Fitness'
                          ];

                          return Text(
                            titles[index],
                            style: appFont.f14w500White
                                .copyWith(color: Colors.grey),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) {
                          List<String> values = [
                            'Yes',
                            'All india Permit',
                            'Yes'
                          ];
                          return Text(
                            values[index],
                            style: appFont.f14w400Black
                                .copyWith(color: appColors.primary),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      '₹ 32.6L-40.2L',
                      style: appFont.f16w600Black,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      radius: 30,
                      width: 150,
                      height: 45,
                      backgroundColor: Color.fromARGB(255, 99, 211, 166),
                      titleStyle: appFont.f14w600White,
                      title: 'Bid Now',
                      onTap: () {},
                    )
                  ],
                ),
                ...List.generate(
                  2,
                  (index) {
                    List<String> titles = [
                      'Eligible For Bidding',
                      '10% Bidding Commitment amount payble'
                    ];
                    List<IconData> icons = [
                      Icons.check,
                      Icons.currency_rupee_outlined
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 15,
                              child: Icon(
                                icons[index],
                                color: Colors.white,
                                size: 19,
                              )),
                          appSpaces.spaceForWidth10,
                          Text(titles[index])
                        ],
                      ),
                    );
                  },
                )
              ],
            );
            }else if(state is VehicleFetchError){
              return Center(child: Text('Somthing went wrong',style: appFont.f16w600Black,),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
