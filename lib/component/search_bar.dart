import 'package:cflutter4/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 15,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black87,
                  ),
                  hintMaxLines: 1,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: "Spicy Fried Chicken",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: TextStyle(color: Colors.black87),
                cursorColor: Colors.black87,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Ink(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.tune_rounded,
                        color: AppConstant.black1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
