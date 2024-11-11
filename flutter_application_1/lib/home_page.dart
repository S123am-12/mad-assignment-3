import 'package:flutter/material.dart';
import 'package:flutter_application_1/gesture.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {  
    Widget buildBody() {
      //added comment
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildJournalHeader(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const Divider(),
                    _buildWeather(),
                    const Divider(),
                    _buildTags(),
                    const Divider(),
                    _buildFooter(),
                    const Divider(),
                    TextButton(
                     style:  TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GasturePage()),
                        );
                      }, 
                      child:const Text('Go to gester page'),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layouts',
          style: TextStyle(color: Colors.black45),
        ),
        //abccccc
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black45),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cloud_queue),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Image _buildJournalHeader() {
    return const Image(
      image: AssetImage('images/present.jpg'),
      fit: BoxFit.cover,
    );
  }

  Column _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Birthday',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          'It\'s going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie.',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Row _buildWeather() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Colors.orange,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '81°F',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'Sunny',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ],
        ),
        SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4500 San Alpho Drive, Dallas,',
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'TX, United States',
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Wrap _buildTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: const TextStyle(fontSize: 10.0),
          ),
          avatar: Icon(
            Icons.card_giftcard,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _buildFooter() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/salmon.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/asp.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/aspo.jpg'),
          radius: 40.0,
        ),
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
            ],
          ),
        ),
      ],
    );
  }
}
