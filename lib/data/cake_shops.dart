import '../models/cake_shop.dart';

// Coursework sample data transcribed/adapted from the supplied reference.
// Coordinates and contact information are examples, not a verified live directory.
const cakeShops = <CakeShop>[
  CakeShop(
      name: 'Yellow Spoon Pastry',
      phone: '0854822842',
      address: 'เอกมัย 19 และโครงการ The 21',
      description:
          'ร้านขนมอบและเค้กโฮมเมด มีเค้กหลากหลายรสชาติให้เลือก ทั้งเค้กผลไม้ ช็อกโกแลต และขนมอบ เหมาะสำหรับวันพิเศษและช่วงเวลาพักผ่อน',
      openCloseTime: 'ทุกวัน 10.00–20.00 น.',
      website: 'https://www.yellowspoonpastry.com/',
      facebook: 'https://www.facebook.com/yspastry/',
      latitude: 13.736834,
      longitude: 100.585712,
      images: [
        'assets/images/cake_1.jpg',
        'assets/images/cake_3.jpg',
        'assets/images/cake_6.jpg'
      ]),
  CakeShop(
      name: 'Vista Cafe by Verasu',
      phone: '022548100',
      address: 'วีรสุ ถนนวิทยุ',
      description:
          'คาเฟ่และเบเกอรี่ มีขนมเค้กและเครื่องดื่มหลากหลาย เหมาะสำหรับนั่งพักผ่อนและเลือกของฝากสำหรับคนพิเศษ',
      openCloseTime: 'ทุกวัน 09.00–19.00 น.',
      website: 'https://www.vistacafe.co.th/',
      facebook: 'https://www.facebook.com/Vistacafe/',
      latitude: 13.7403,
      longitude: 100.547417,
      images: [
        'assets/images/cake_2.jpg',
        'assets/images/cake_4.jpg',
        'assets/images/cake_5.jpg'
      ]),
  CakeShop(
      name: 'Sweet Spell',
      phone: '0846666828',
      address: 'พหลโยธิน ประชาชื่น',
      description:
          'ร้านขนมหวานและเค้กสำหรับทุกโอกาส เลือกชิมเค้กเนื้อนุ่มและขนมหลากรส พร้อมแบ่งปันความอร่อยกับครอบครัวและเพื่อน',
      openCloseTime: 'ทุกวัน 10.00–20.00 น.',
      website: 'https://www.sweetspell.com/dessert-menu/',
      facebook: 'https://www.facebook.com/sweetspellcafe/',
      latitude: 13.771741,
      longitude: 100.586662,
      images: [
        'assets/images/cake_5.jpg',
        'assets/images/cake_6.jpg',
        'assets/images/cake_7.jpg'
      ]),
  CakeShop(
      name: 'Larna House',
      phone: '023215995',
      address: 'พัฒนาการ 61',
      description:
          'คิดถึงเค้กช็อกโกแลต ต้องนึกถึง Larna House เพราะร้านนี้มีจุดเด่นอยู่ที่เค้กช็อกโกแลตและเค้กสูตรต้นตำรับ สร้างสรรค์เค้กจากประสบการณ์กว่า 20 ปี ให้ได้รสชาติหอม นุ่มละมุน ชุ่มฉ่ำ และความสุขในทุกคำ',
      openCloseTime: 'ทุกวัน 09.00–21.00 น.',
      website: 'https://larnahouse.com/',
      facebook: 'https://www.facebook.com/larnahouse/',
      latitude: 13.730245,
      longitude: 100.6858385,
      images: [
        'assets/images/cake_7.jpg',
        'assets/images/cake_1.jpg',
        'assets/images/cake_8.jpg'
      ]),
  CakeShop(
      name: 'I bake & You take',
      phone: '0934499447',
      address: 'รามอินทรา 60',
      description:
          'ร้านเค้กสั่งทำสำหรับวันเกิดและโอกาสพิเศษ มีทั้งเค้กปอนด์และขนมชิ้นเล็ก เลือกรูปแบบและรสชาติที่เหมาะกับผู้รับ',
      openCloseTime: 'ทุกวัน 09.30–19.30 น.',
      website: 'https://ibakeyoutake.com/',
      facebook: 'https://www.facebook.com/ibakeyoutakebyjane/',
      latitude: 13.864575,
      longitude: 100.5823,
      images: [
        'assets/images/cake_3.jpg',
        'assets/images/cake_2.jpg',
        'assets/images/cake_6.jpg'
      ]),
  CakeShop(
      name: 'Coffee bean by dao',
      phone: '026109702',
      address: 'เซ็นทรัลเวิลด์',
      description:
          'ร้านอาหารและเบเกอรี่ที่มีเค้กให้เลือกหลายชนิด ทั้งเค้กผลไม้ ชีสเค้ก และเค้กช็อกโกแลต เหมาะกับการทานคู่เครื่องดื่มแก้วโปรด',
      openCloseTime: 'ทุกวัน 10.00–22.00 น.',
      website: 'https://www.coffeebeans.co.th/',
      facebook: 'https://www.facebook.com/CoffeeBeansbyDao/',
      latitude: 13.7469287,
      longitude: 100.5394388,
      images: [
        'assets/images/cake_4.jpg',
        'assets/images/cake_5.jpg',
        'assets/images/cake_8.jpg'
      ]),
  CakeShop(
      name: 'Bake Ministry',
      phone: '0815404244',
      address: 'นวมินทร์ 28',
      description:
          'เค้กโฮมเมดแบบ Made to order สำหรับงานฉลองและวันพิเศษ มีขนมและเค้กหลายสไตล์ให้เลือกตามความชอบ',
      openCloseTime: 'ทุกวัน 10.00–18.00 น.',
      website: 'https://www.bakeministry.com/',
      facebook: 'https://www.facebook.com/bakeministry/',
      latitude: 13.7782199,
      longitude: 100.5705757,
      images: [
        'assets/images/cake_8.jpg',
        'assets/images/cake_7.jpg',
        'assets/images/cake_2.jpg'
      ]),
];
const bannerImages = [
  'assets/images/cake_1.jpg',
  'assets/images/cake_5.jpg',
  'assets/images/cake_2.jpg'
];
