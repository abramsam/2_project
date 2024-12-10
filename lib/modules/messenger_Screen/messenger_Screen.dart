import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(
            start: 5.0,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
              ),
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.black,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 4.0,
                  bottom: 4.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.red,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 4.0,
                  end: 7.0,
                ),
                child: Text(
                  "5",
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
        title: const Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        // titleSpacing: 20.0,
        actions: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.black,
            child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.camera_enhance_outlined),
                iconSize: 35.0,
                color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.edit),
              iconSize: 35.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              // Search
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[600],
                ),
                padding: const EdgeInsetsDirectional.only(
                  start: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200.0,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) => storyItem(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 15.0,
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              ListView.separated(
                itemBuilder: (BuildContext context, int index) => chatItem(),
                separatorBuilder: (BuildContext context, int index){
                  return const SizedBox(
                    height: 15.0,
                  );
                },
                itemCount: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row chatItem() => Row(
    children: [
      const Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage("https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
          ),
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 5.0,
              end: 5.0,
            ),
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ebram Samuel Helmy",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Message Message Message Message Message Message Message Message Message MessageMessage Message",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                const Text(
                  "20:22",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Container storyItem() => Container(
    width: 80.0,
    padding: const EdgeInsetsDirectional.only(
      top: 20.0,
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage("https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
            ),
            CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 5.0,
                end: 5.0,
              ),
              child: CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          "Ebram Samuel Helmy",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
