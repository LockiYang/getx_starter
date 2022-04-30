import 'package:flutter/material.dart';

import '../../basic_widgets/widgets/credit_card.dart';
import '../../basic_widgets/widgets/friend_circle.dart';
import '../../basic_widgets/widgets/mock_data.dart';
import '../../basic_widgets/widgets/pet_card.dart';

class NormalList extends StatelessWidget {
  const NormalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CreditCard(data: creditCardData),
        PetCard(data: petCardData),
        FriendCircle(data: friendCircleData),
      ],
    );
  }
}
