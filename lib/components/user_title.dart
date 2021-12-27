import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

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
                color: Colors.orange,
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                color: Colors.red,
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          )),
    );
  }
}
