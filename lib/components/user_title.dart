import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';

class UserTitle extends StatelessWidget {
  final User user;

  const UserTitle(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                color: Colors.blueGrey,
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          )),
    );
  }
}
