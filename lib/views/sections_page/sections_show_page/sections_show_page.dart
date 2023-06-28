import 'package:flutter/material.dart';
import 'package:omar_system/views/errors/no_data.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../../app_info.dart';
import '../../../controllers/call_records_controller.dart';
import '../../../services/api_links.dart';
import '../../../size_config.dart';
import '../../../widgets/customer_card.dart';
import '../../../widgets/main_card.dart';
import '../../../widgets/title_widget.dart';
import 'data_filter.dart';



class SectionsShow extends StatefulWidget {
  static String routeName = "/sectionsShow";
  final String? catId ;
  final String? catName ;

  const SectionsShow({Key? key, this.catId, this.catName}) : super(key: key);

  @override
  State<SectionsShow> createState() => _SectionsShowState();
}

class _SectionsShowState extends State<SectionsShow> {


  bool hasMoreData = false;
  bool pageEnd = false;

  ScrollController? _scrollController;

  _loadMoreItems(){
    setState(() {
      hasMoreData = true;
    });

    if(recordsData.thisPage < recordsData.lastPage){
      recordsData.getData("$sectionsShowURL${widget.catId}&customer_status=${recordsData.customerStatus}&phone_status=${recordsData.phoneStatus}&final_results=${recordsData.finalStatus}&${recordsData.nameType}=${recordsData.name}&${recordsData.filterUrl}&page=${recordsData.thisPage+1}" ,false).then((data){
        recordsData.thisPage++;
        setState(() {
          hasMoreData = false;
        });
      });
    } else{
      setState(() {
        hasMoreData = false;
        pageEnd = true;
      });
    }

  }
  getData(){
    setState(() {

    });
    recordsData.getData("$sectionsShowURL${widget.catId}&customer_status=${recordsData.customerStatus}&phone_status=${recordsData.phoneStatus}&final_results=${recordsData.finalStatus}&${recordsData.nameType}=${recordsData.name}", true).then((data){
      setState(() {
      });
    });
  }

  @override
  void initState() {
    getData();

    _scrollController = ScrollController();
    _scrollController?.addListener(() {

      if (_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) {
        if (!pageEnd) _loadMoreItems();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text('Section Data'),
      ),

      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [

            StickyHeader(
              header: Container(
                color: checkDarkTheme(context.m)? Colors.black:Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       SizedBox(
                         width: screenWidthMultiply(0.6, context),
                           child: TitleWidget(  title: widget.catName!, haveBorder: false, )),

                      if (recordsData.callRecords.isNotEmpty)
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>  DataFilter(getData: getData,));
                          },
                          child: const Icon(Icons.filter_list_sharp),
                        )

                        // GestureDetector(
                        //   onTap: ()=> showSearch(
                        //     context: context,
                        //     delegate: SearchPage<SectionsModel>(
                        //       items: sections.sections,
                        //       searchLabel: "search",
                        //       searchStyle: const TextStyle(color: $textColor),
                        //       suggestion:const Center(
                        //         child:  Text("search by Section Name"),
                        //       ),
                        //       failure: const Center(
                        //         child: Text('no result'),
                        //       ),
                        //       filter: (person) => [
                        //         person.title,
                        //         // person.address,
                        //         // person.numberFund.toString(),
                        //       ],
                        //       builder: (sections) =>
                        //           MainCard(
                        //             color: checkDarkTheme(context.m)
                        //                 ? Colors.black
                        //                 : const Color(0xFFD3D3D3),
                        //             cardChild : SectionsCards(
                        //               id: sections.id,
                        //               title: sections.title,
                        //               totalNumber: sections.callRecordCount,
                        //               department: sections.title,
                        //               followNumber: sections.dayFollow,
                        //               pendingNumber: sections.dayFollow2,
                        //               waitingNumber: sections.dayFollow3,
                        //             ),
                        //           ),
                        //
                        //     ),
                        //   ),
                        //   child: const Icon(Icons.search_rounded),
                        // )
                    ],
                  ),
                ),
              ),
              content: Column(
                children: [
                  if(recordsData.hasErr)
                   const Text('We seem to be having a problem at the moment, please try again'),
                  // if (recordsData.isLoading && !recordsData.hasErr)
                  //   const InCardShimmer(listLength: 9,),


                  if(recordsData.callRecords.isEmpty && !recordsData.isLoading)
                    const NoData(),

                    if (recordsData.data != null)
                    SizedBox(height: screenHeightMultiply(0.02, context),),

                  if(recordsData.callRecords.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      itemCount:  recordsData.callRecords.length,
                        itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8),
                        child: MainCard(
                          color: checkDarkTheme(context.m)
                              ? Colors.black
                              : const Color(0xFFD3D3D3),
                          cardChild: CustomerCard(
                            date: recordsData
                                .callRecords[index].updatedAt,
                            dateOfVisits: recordsData
                                .callRecords[index].dateOfVists,
                            dateOfCall: recordsData
                                .callRecords[index].dateOfCall,
                            customerName: recordsData
                                .callRecords[index].name,
                            agent: recordsData
                                .callRecords[index].agent!.name,
                            agentImg: recordsData
                                .callRecords[index]
                                .agent!
                                .avatarUrl,
                            email: recordsData
                                .callRecords[index].email,
                            finalResults: recordsData
                                .callRecords[index]
                                .finalResults,
                            phone: recordsData
                                .callRecords[index].phone,
                            city: recordsData
                                .callRecords[index].city,
                            phoneStatus: recordsData
                                .callRecords[index].phoneStatus,
                            status: recordsData
                                .callRecords[index]
                                .customerStatus,
                          ),
                        ),
                      );
                    }),

                  if(hasMoreData)
                  Column(
                    children:const [
                       SizedBox(height: 20,),
                        Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                       SizedBox(height: 40,),
                    ],
                  ),

                  if(pageEnd)
                  Column(
                    children:const [
                      SizedBox(height: 20,),
                     Text('_________________ '),
                      SizedBox(height: 10,),

                      Text('No More Data To Show ... '),
                      SizedBox(height: 40,),
                    ],
                  ),

                  SizedBox(height: screenHeightMultiply(0.02, context),),



                  // ...List.generate(sections.sections.length, (index) =>
                  //     SectionsCards(
                  //       id: sections.sections[index].id,
                  //       title: sections.sections[index].title, totalNumber: sections.sections[index].callRecordCount, department: sections.sections[index].title, followNumber: sections.sections[index].dayFollow, pendingNumber: sections.sections[index].dayFollow2, waitingNumber: sections.sections[index].dayFollow3,)),

                ],
              ),

            ),
          ],
        ),
      ),

    );
  }
}
