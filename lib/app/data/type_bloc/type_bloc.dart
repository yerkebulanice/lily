import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/data/entity/flower.dart';
import 'package:lily/app/data/entity/types.dart';

part 'type_event.dart';
part 'type_state.dart';

class TypeBloc extends Bloc<TypeEvent, TypeState> {
  List<Type> types = [
    Type(
      name: 'Bouquets',
      flowers: [
        Flower(image: BouquetsAsset.image1, name: 'Enchanted Garden', price: 12000),
        Flower(image: BouquetsAsset.image2, name: 'Whispering Petals', price: 14000),
        Flower(image: BouquetsAsset.image3, name: 'Serenity Blooms', price: 11000),
        Flower(image: BouquetsAsset.image4, name: 'Radiant Rainbow', price: 16000),
        Flower(image: BouquetsAsset.image5, name: 'Ethereal Elegance', price: 13000),
        Flower(image: BouquetsAsset.image6, name: 'Mystic Meadow', price: 11500),
        Flower(image: BouquetsAsset.image7, name: 'Harmony Bouquet', price: 12000),
        Flower(image: BouquetsAsset.image8, name: 'Burst of Joy', price: 15000),
      ],
      isSelected: true,
    ),
    Type(
      name: 'Indoor',
      flowers: [
        Flower(image: IndoorAsset.image1, name: 'Zen Haven', price: 6000),
        Flower(image: IndoorAsset.image2, name: 'Leafy Oasis', price: 7500),
        Flower(image: IndoorAsset.image3, name: 'Botanical Bliss', price: 11000),
        Flower(image: IndoorAsset.image4, name: 'Serenity Greens', price: 10000),
        Flower(image: IndoorAsset.image5, name: 'Tropical Treasures', price: 8000),
        Flower(image: IndoorAsset.image6, name: 'Urban Jungle', price: 9000),
        Flower(image: IndoorAsset.image7, name: 'Natures Corner', price: 12000),
        Flower(image: IndoorAsset.image8, name: 'Green Harmony', price: 10500),
      ],
    ),
    Type(
      name: 'Outdoor',
      flowers: [
        Flower(image: OutdoorAsset.image1, name: 'Sun-Kissed Gardens', price: 12000),
        Flower(image: OutdoorAsset.image2, name: 'Tranquil Terrace', price: 14000),
        Flower(image: OutdoorAsset.image3, name: 'Botanical Retreat', price: 11000),
        Flower(image: OutdoorAsset.image4, name: 'Lush Horizon', price: 16000),
        Flower(image: OutdoorAsset.image5, name: 'Harmonious Hedges', price: 13000),
        Flower(image: OutdoorAsset.image6, name: 'Whispering Winds', price: 11500),
        Flower(image: OutdoorAsset.image7, name: 'Dewdrop Gardens', price: 12000),
        Flower(image: OutdoorAsset.image8, name: 'Radiant Arboretum', price: 15000),
      ],
    ),
    Type(
      name: 'Workshop',
      flowers: [
        Flower(image: WorkshopsAsset.image1, name: 'Blooming Creativity', price: 40000),
        Flower(image: WorkshopsAsset.image2, name: 'Floral Fusion Workshop', price: 37000),
        Flower(image: WorkshopsAsset.image3, name: 'Petals & Palettes', price: 30000),
        Flower(image: WorkshopsAsset.image4, name: 'Bouquet Bliss', price: 50000),
        Flower(image: WorkshopsAsset.image5, name: 'The Art of Arrangement', price: 20000),
        Flower(image: WorkshopsAsset.image6, name: 'Flower Crafting Haven', price: 25000),
      ],
    ),
  ];

  Type get getSelected {
    for (var i in types) {
      if (i.isSelected) return i;
    }
    return types[0];
  }

  TypeBloc() : super(TypeInitial()) {
    on<TypeEvent>((event, emit) {
      // emit(ChangeTypeState(types));
    });
    on<ChangeTypeEvent>(changeType);
  }

  Future<void> changeType(ChangeTypeEvent event, Emitter<TypeState> emit) async {
    print('Index: ${event.index}');

    // Create a new list by copying the current state
    List<Type> changedType = List.from(types);

    for (int i = 0; i < changedType.length; i++) {
      if (i == event.index) {
        changedType[i] = changedType[i].copyWith(isSelected: true); // Create a new instance with updated state
      } else {
        changedType[i] = changedType[i].copyWith(isSelected: false); // Deselect others
      }
    }

    print('TYPES: ${changedType.map((e) => e.isSelected)}');

    // Emit the new state with the updated list
    emit(ChangeTypeState(List.from(changedType))); // Ensure immutability by emitting a new list
  }
}
