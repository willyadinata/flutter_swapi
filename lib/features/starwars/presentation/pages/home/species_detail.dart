import 'package:flutter/material.dart';

import '../../../../../common/theme/theme_fonts.dart';
import '../../../domain/entities/species_entity.dart';

class SpeciesDetail extends StatelessWidget {
  final SpeciesEntity species;

  const SpeciesDetail({
    Key? key,
    required this.species,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Species - Detail Information'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    CircleAvatar(
                      child: const Icon(Icons.person),
                      radius: MediaQuery.of(context).size.width * 0.060,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      '${species.name}',
                      style: ThemeFonts.h1,
                    ),
                    Text(
                      'Class ${species.classification}',
                      style: ThemeFonts.sub2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Species Criteria',
                    style: ThemeFonts.h2,
                  ),
                ),
              ),
              Center(
                child: Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(3, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Average Height:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.averageHeight} cm',
                          style: ThemeFonts.body,
                        ),
                        Text(
                          'Average Lifespan:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.averageLifespan} years',
                          style: ThemeFonts.body,
                        ),
                        Text(
                          'Average Language:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.language}',
                          style: ThemeFonts.body,
                        ),
                        Text(
                          'Eye Colors:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.eyeColors}',
                          style: ThemeFonts.body,
                        ),
                        Text(
                          'Hair Colors:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.hairColors}',
                          style: ThemeFonts.body,
                        ),
                        Text(
                          'Skin Colors:',
                          style: ThemeFonts.sub1,
                        ),
                        Text(
                          '${species.skinColors}',
                          style: ThemeFonts.body,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
