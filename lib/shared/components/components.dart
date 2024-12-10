import 'package:flutter/material.dart';
import 'package:sample_app/modules/web_view/web_view_screen.dart';
import 'package:sample_app/shared/cubit/cubit.dart';

Widget defaultButton({
  required var on_Pressed,
  required String text,
  double width = double.infinity,
  Color backgroundColor = Colors.blue,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 30.0,
  Color textColor = Colors.white,
}){
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: backgroundColor,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
    onPressed: on_Pressed,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
      ),
    ),
    ),
  );
}

/*Widget defaultTextFormField({
  required String hintText,
  required String labelText,
  required TextEditingController controller,
  required Widget prefixIcon,
  required TextInputType keyboardType,
  var onFieldSubmitted,
  var onChanged,
  String? Function(String?)? validator,
  Widget? suffixIcon,
  bool obscureText = false,
  void Function()? onTap,
  bool enabled = true,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
    ),
    obscureText: obscureText,
    keyboardType: keyboardType,
    enabled: enabled,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChanged,
    validator: validator,
    onTap: onTap,
  );
}*/

Widget defaultTextFormField({
  required String hintText,
  required String labelText,
  required TextEditingController controller,
  required Widget prefixIcon,
  required TextInputType keyboardType,
  var onFieldSubmitted,
  var onChanged,
  String? Function(String?)? validator,
  Widget? suffixIcon,
  bool obscureText = false,
  void Function()? onTap,
  bool enabled = true,
  Color? prefixIconColor = Colors.white,
  Color? suffixIconColor = Colors.white,
  TextStyle? hintStyle = const TextStyle(),
  TextStyle? labelStyle = const TextStyle(),
  TextStyle? style = const TextStyle(color: Colors.white,),
}) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      style: style
  );
}

Widget buildTaskItem(Map task, BuildContext context) {
  return Dismissible(
    key: Key(task["id"].toString()),
    onDismissed: (direction) {
      AppCubit.get(context).deleteDatabase(id: task["id"]);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.blue[800],
            child: Text(
              task["time"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  task["date"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).updateDatabase(
                  status: "done",
                  id: task["id"],
              );
            },
            icon: const Icon(
              Icons.check_box_outlined,
              size: 40.0,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).updateDatabase(
                status: "archived",
                id: task["id"],
              );
            },
            icon: const Icon(
              Icons.archive_outlined,
              size: 40.0,
              color: Colors.black45,
            ),
          ),
          /*Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.redAccent
            ),
            padding: const EdgeInsetsDirectional.all(5.0),
            child: Text(
              task["status"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),*/
        ],
      ),
    ),
  );
}

Widget tasksBuilder({required List<Map> tasks}) {
  return tasks.isNotEmpty ? ListView.separated(
    itemBuilder: (context, index) {
      return buildTaskItem(tasks[index], context);
    },
    separatorBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 10.0,
        ),
        child: Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey,
        ),
      );
    },
    itemCount: tasks.length,
  ) : const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          "No Tasks Yet",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget buildRowOfArticle(List<dynamic> article, int index, BuildContext context) {
  var item = article[index];
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(url: item["url"]));
    },
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: item["urlToImage"] != null
                  ? NetworkImage(item["urlToImage"])
                  : const AssetImage("assets/images/null.png") as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item["title"] ?? 'No title',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  item["publishedAt"] ?? 'No date',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildArticleItem(List<dynamic> article, BuildContext context) {
  return ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return buildRowOfArticle(article, index, context);
    },
    separatorBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 20.0),
        child: Container(
          height: 1.0,
          color: Colors.grey,
        ),
      );
    },
    itemCount: article.length,
  );
}

Widget articleBuilder(List list, BuildContext context, {bool isSearch = false}) {
  return Padding(
    padding: const EdgeInsetsDirectional.all(20.0),
    child: list.isNotEmpty ? buildArticleItem(list, context) : isSearch ? Container() :
    const Center(
      child : CircularProgressIndicator(
        color: Colors.deepOrange,
      ),
    ),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}