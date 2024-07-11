enum TodoistColor {
  berryRed('berry_red', '0xFFB8256F'),
  red('red', '0xFFDB4035'),
  orange('orange', '0xFFFF9933'),
  yellow('yellow', '0xFFFAD000'),
  oliveGreen('olive_green', '0xFFAfb83B'),
  limeGreen('lime_green', '0xFF7ECC49'),
  green('green', '0xFF299438'),
  mintGreen('mint_green', '0xFF6ACBC'),
  teal('teal', '0xFF158FAD'),
  skyBlue('sky_blue', '0xFF14AAF5'),
  lightBlue('light_blue', '0xFF96C3EB'),
  blue('blue', '0xFF4073FF'),
  grape('grape', '0xFF884DFF'),
  violet('violet', '0xFFAF38EB'),
  lavender('lavender', '0xFFEB96EB'),
  magenta('magenta', '0xFFE05194'),
  salmon('salmon', '0xFFFF8D85'),
  charcoal('charcoal', '0xFF808080'),
  grey('grey', '0xFFB8B8B8'),
  taupe('taupe', '0xFFCCAC93');

  final String name;
  final String colorCode;

  const TodoistColor(this.name, this.colorCode);

  static TodoistColor fromName(String name) {
    return TodoistColor.values.firstWhere((e) => e.name == name, orElse: () {
      throw ArgumentError('Invalid color name: $name');
    });
  }

  static String colorCodeFromName(String name) {
    return fromName(name).colorCode;
  }
}
