import 'package:flutter/material.dart';

class CurvedDrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  final int index;
  final int selectedIndex;
  final Color? backgroundColor;

  const CurvedDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
    this.backgroundColor,
  });

  @override
  State<CurvedDrawerItem> createState() => _CurvedDrawerItemState();
}

class _CurvedDrawerItemState extends State<CurvedDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        color: widget.index == widget.selectedIndex
            ? widget.backgroundColor ?? Theme.of(context).primaryColor
            : Colors.white,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: widget.index == widget.selectedIndex
              ? Colors.black
              : Colors.white,
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

class CurvedDrawer extends StatefulWidget {
  final int selectedIndex;
  final List<Widget> items;
  final Color? backgroundColor;

  const CurvedDrawer({
    super.key,
    required this.selectedIndex,
    required this.items,
    this.backgroundColor,
  });

  @override
  State<CurvedDrawer> createState() => _CurvedDrawerState();
}

class _CurvedDrawerState extends State<CurvedDrawer> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (widget.selectedIndex < 1) {
      return const Center(
        child: Text('Selected Index Needs to be atleast 1'),
      );
    }

    if (widget.selectedIndex > widget.items.length) {
      return Center(
        child: Text(
          'Selected Index - ${widget.selectedIndex} Needs can\'t be greater than number of total items - ${widget.items.length} !',
        ),
      );
    }

    children.add(const ListTile());
    children.addAll(widget.items);
    children.add(const ListTile());

    return Container(
      color: widget.backgroundColor ?? Theme.of(context).primaryColor,
      child: ListView.builder(
        itemCount: children.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: index == widget.selectedIndex - 1 ||
                    index == widget.selectedIndex + 1
                ? Colors.white
                : widget.backgroundColor ?? Theme.of(context).primaryColor,
            margin: const EdgeInsets.only(left: 16.0),
            child: ClipRRect(
              borderRadius: generateBorder(index),
              child: Container(
                decoration: BoxDecoration(
                  color: index == widget.selectedIndex
                      ? Colors.white
                      : widget.backgroundColor ??
                          Theme.of(context).primaryColor,
                ),
                child: children[index],
              ),
            ),
          );
        },
      ),
    );
  }

  BorderRadiusGeometry generateBorder(int index) {
    if (index == widget.selectedIndex - 1) {
      return const BorderRadius.only(
        bottomRight: Radius.circular(30.0),
      );
    }

    if (index == widget.selectedIndex + 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(30.0),
      );
    }

    return const BorderRadius.only(
      topLeft: Radius.circular(30.0), // Adjust the radius value as needed
      bottomLeft: Radius.circular(30.0), // Adjust the radius value as needed
    );
  }
}
