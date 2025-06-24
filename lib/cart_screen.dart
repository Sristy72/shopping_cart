import 'package:flutter/material.dart';


class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<ImageDetails> details_Image = [
    ImageDetails(
      imagePath: 'images/pullOver.png',
      title: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/tShirt.png',
      title: 'T-shirt',
      color: 'Grey',
      size: 'L',
      price: 30,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/sport_dress.png',
      title: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/jacket.jpg',
      title: 'Jacket',
      color: 'Blue',
      size: 'M',
      price: 50,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/pullOver.png',
      title: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/tShirt.png',
      title: 'T-shirt',
      color: 'Grey',
      size: 'L',
      price: 30,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/sport_dress.png',
      title: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
    ),
    ImageDetails(
      imagePath: 'images/jacket.jpg',
      title: 'Jacket',
      color: 'Blue',
      size: 'M',
      price: 50,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Bag",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: itemList(constraints),
                  ),
                ),

                totalAmount(context),
                const SizedBox(height: 18,),
                checkOutButton(context)
              ],
            );
          },
        ),
      ),

    );
  }

  Widget checkOutButton(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(onPressed: _checkout, child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('CHECK OUT'),
            ))));
  }

  Widget totalAmount(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total amount: ', style: TextStyle(color: Colors.black54, fontSize: 18),),
              Text('${calculateTotalAmount().toInt()}\$ ', style: const TextStyle(color: Colors.black,
                  fontSize: 20, fontWeight: FontWeight.w500),),
            ],
          )),
    );
  }

  Widget itemList(BoxConstraints constraints) {
    return Column(
      children: [
        for (int i = 0; i < details_Image.length; i++)
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: constraints.maxWidth,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(//TODO: Items images
                      height: 140,
                      width: 135,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: const Color.fromARGB(255, 248, 248, 248),
                        image: DecorationImage(
                          image: AssetImage(details_Image[i].imagePath, ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(//TODO:For items details
                        width: constraints.maxWidth,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row( //TODO: show items title
                                children: [
                                  Text(details_Image[i].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  const Icon(Icons.more_vert, color: Colors.black54,)
                                ],
                              ),
                              Row( //TODO: show items color
                                children: [
                                  const Text('Color: ', style: TextStyle(color: Colors.black38, fontSize: 13)),
                                  Text(details_Image[i].color, style: const TextStyle(fontSize: 13)),
                                  const SizedBox(width: 20),
                                  Row(//TODO: show items size
                                    children: [
                                      const Text('Size: ', style: TextStyle(color: Colors.black38, fontSize: 13)),
                                      Text(details_Image[i].size, style: const TextStyle(fontSize: 13)),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Row( //TODO: show increment and decrement button
                                  children: [
                                    GestureDetector(
                                      onTap: () => decreaseItemCount(i),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(60),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 7,
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: const Icon(Icons.remove, color: Colors.black45),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      '${details_Image[i].quantity}',
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: () => increaseItemCount(i),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(60),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 7,
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: const Icon(Icons.add, color: Colors.black54),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container( //TODO: show unit price of the items
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Text('${details_Image[i].price}\$', style: TextStyle(fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  void increaseItemCount(int index) {
    setState(() {
      details_Image[index].quantity++;
      if (details_Image[index].quantity == 5) {
        _showDialog(index);
      }
    });
  }

  _showDialog(int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Align(
              alignment: Alignment.center,
              child: Text("Congratulatios!", style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 18),)),
          content: Text("You have added \n 5  \n${details_Image[index].title} on your bag!", textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
          actions: [
            Container(
              width: 250,
              margin: const EdgeInsets.only(right: 7),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("OK"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void decreaseItemCount(int index) {
    setState(() {
      if (details_Image[index].quantity > 1) {
        details_Image[index].quantity--;
      }
    });
  }

  double calculateTotalAmount() {
    double totalAmount = 0;
    for (var item in details_Image) {
      totalAmount += item.quantity * item.price;
    }
    return totalAmount;
  }

  _checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! Checkout successful.'),
      ),
    );
  }

}

class ImageDetails {
  late String imagePath;
  late String title;
  late String color;
  late String size;
  late int price;
  late int quantity;

  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
  });
}
