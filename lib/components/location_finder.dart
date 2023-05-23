import 'package:climata/constants/country_const.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class LocationFinder extends StatefulWidget {
  final Function(String locationName) onSelectLocation;

  const LocationFinder({
    super.key,
    required this.onSelectLocation,
  });

  @override
  State<LocationFinder> createState() => _LocationFinderState();
}

class _LocationFinderState extends State<LocationFinder> {
  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: SearchField(
        suggestionsDecoration: SuggestionDecoration(
          color: Colors.blue.shade300,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.blueAccent,
          ),
        ),
        suggestionItemDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Colors.blue,
                Colors.blue.shade300,
              ]),
          color: Colors.blue,
        ),
        searchInputDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: const OutlineInputBorder(),
        ),
        marginColor: Colors.blue.shade300,
        onSuggestionTap: (location) {
          widget.onSelectLocation(location.item.toString());
          focus.unfocus();
        },
        focusNode: focus,
        suggestions: locationList
            .map((locationName) => SearchFieldListItem(locationName,
                item: locationName,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(locationName,
                      style: const TextStyle(color: Colors.white)),
                )))
            .toList(),
        hint: 'Search by location name',
        validator: (x) {
          if (x!.isEmpty || !locationList.contains(x)) {
            return 'Please Enter a valid location';
          }
          return null;
        },
        maxSuggestionsInViewPort: 4,
        itemHeight: 45,
        textCapitalization: TextCapitalization.words,
      ),
    );
  }
}
