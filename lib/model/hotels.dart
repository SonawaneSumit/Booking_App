import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Hotel {
  final int id;
  final String title, description, city, location, address;
  final List<String> images;
  final String Rimages;
  final List<Color> colors;
  final int price, Acprice;
  final int disPrice;
  final double rating;
  final bool isFavourite, isPopular;

  Hotel(
      {required this.id,
      required this.images,
      required this.Rimages,
      required this.colors,
      this.rating = 0.0,
      this.isFavourite = false,
      this.isPopular = false,
      required this.title,
      required this.price,
      required this.Acprice,
      required this.disPrice,
      required this.description,
      required this.address,
      required this.location,
      required this.city});

  String getFormattedPrice() {
    final format = NumberFormat("#,###");
    return format.format(price);
  }
}

// Our demo Products

List<Hotel> demoProducts = [
  Hotel(
    id: 1,
    images: [
      "asset/image/hotels/Nashik/courtyard/courtyard.jpg",
      "asset/image/hotels/Nashik/courtyard/courtyardBedroom.jpg",
      "asset/image/hotels/Nashik/courtyard/courtyardLounge.jpg",
      "asset/image/hotels/Nashik/courtyard/courtyardReception.jpg",
    ],
    Rimages: "asset/image/hotels/Nashik/courtyard/courtyardBedroom.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Courtyard by Marriott",
    address: "Renuka Nagar, Nashik",
    price: 9900,
    disPrice: 6500,
    Acprice: 6800,
    description:
        "Conveniently situated in the Renuka Nagar part of Nashik, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Ozar Airport. Rated with 5 stars, this high-quality property provides guests with access to massage, indoor pool and steamroom on-site.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    location: "https://maps.app.goo.gl/yyk6h2N2kJRfAY1Q9",
    city: "Nashik",
  ),
  Hotel(
    id: 2,
    images: [
      "asset/image/hotels/Nashik/radissionBlue/radissionBlue.jpg",
      "asset/image/hotels/Nashik/radissionBlue/radissonDinning.jpg",
      "asset/image/hotels/Nashik/radissionBlue/radissonRoom.jpg",
      "asset/image/hotels/Nashik/radissionBlue/radissonSpool.jpg"
    ],
    Rimages: "asset/image/hotels/Nashik/radissionBlue/radissonRoom.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Radisson Blu Hotel & Spa",
    address: "MIDC Ambad, Nashik",
    price: 13000,
    disPrice: 9999,
    Acprice: 10300,
    description:
        "Nestled at the foothills of the two-millennia old Pandavleni Caves, discover an idyllic setting for a luxury getaway at the Radisson Blu Hotel & Spa, Nashik. This modern 5-star urban resort, positioned as the flagship property of the group, boasts unparalleled views of the mountains and untouched scenery fringed by abundant lush green landscape. The urban resort features 224 elegantly designed rooms, including 18 suites with private balconies. From fine dining to a relaxed bistro, both -indoor and alfresco. With over 4,500 square meters of versatile event space, our Nashik hotel is rightly recognized as a premium destination for all types of meetings and events amidst a scenic location. After a busy day of business or travel, guests can enjoy a range of treatments at the luxurious spa.",
    rating: 4.1,
    isPopular: true,
    location: "https://maps.app.goo.gl/vvRPZ8upFxeHz2u97",
    city: "Nashik",
  ),
  Hotel(
    id: 3,
    images: [
      "asset/image/hotels/Nashik/expressInn/expressInn.jpg",
      "asset/image/hotels/Nashik/expressInn/diningExpress.jpg",
      "asset/image/hotels/Nashik/expressInn/roomExpressIn.jpg",
      "asset/image/hotels/Nashik/expressInn/diningExpress.jpg",
    ],
    Rimages: "asset/image/hotels/Nashik/expressInn/roomExpressIn.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hotel Express Inn",
    address: "MIDC Ambad, Nashik",
    price: 10999,
    disPrice: 8800,
    Acprice: 9100,
    description:
        "Built to mark a renaissance in standards of service and style, the 197 exquisitely-furnished guest rooms and suites present the finest in hospitality and personalized service. The discerning business traveler will appreciate the state-of-the art business and conference facilities as well as a selection of refined cuisine. Gourmet delights are available at the 24-hour coffee shop 'Aster', The Lounge Bar presenting the choicest beverages from round the globe at 'Le Bar-Salon'. Experience our warmth and great service. Welcome to Express Inn....",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    location: "https://maps.app.goo.gl/hrsVaseayFChYZJT7",
    city: "Nashik",
  ),
  Hotel(
    id: 4,
    images: [
      "asset/image/hotels/Nashik/mbc_Citadel/mbc_Citadel.jpg",
      "asset/image/hotels/Nashik/mbc_Citadel/mbcDinning.jpg",
      "asset/image/hotels/Nashik/mbc_Citadel/mbcLobby.jpg",
      "asset/image/hotels/Nashik/mbc_Citadel/mbcRoom.jpg"
    ],
    Rimages: "asset/image/hotels/Nashik/mbc_Citadel/mbcRoom.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hotel MBC Citadel",
    address: "Satpur, Nashik ",
    price: 8700,
    disPrice: 6552,
    Acprice: 6800,
    description:
        "Hotel MBC Citadel Nashik is a luxury business hotel with 50 rooms equipped with modern amenities, multi-cuisine restaurants and banquet venues to meet all your needs under one roof. Our focus remains on providing the highest levels of hospitality with the help of our well trained and skilled team.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/D7DfdPfK8JSc61Mm6",
    city: "Nashik",
  ),
  //
  //
  /* Hotel list Pune */
  //
  //
  Hotel(
    id: 5,
    images: [
      "asset/image/hotels/Pune/Conrad/Conrad1.jpg",
      "asset/image/hotels/Pune/Conrad/Conrad2.jpg",
      "asset/image/hotels/Pune/Conrad/Conrad3.png",
      "asset/image/hotels/Pune/Conrad/Conrad4.jpg"
    ],
    Rimages: "asset/image/hotels/Pune/Conrad/Conrad4.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Conrad Pune - Luxury by Hilton",
    address: "Koregaon Park, Pune.",
    price: 20052,
    disPrice: 15000,
    Acprice: 16000,
    description:
        "In addition to the standard of Hilton CleanStay, all guests get free Wi-Fi in all rooms and free parking if arriving by car. Conveniently situated in the Koregaon Park part of Pune, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Dagadusheth Halwai Ganapati Temple. Rated with 5 stars, this high-quality property provides guests with access to massage, restaurant and fitness center on-site.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/1taJbPXBBnmJTtkW8",
    city: "Pune",
  ),
  Hotel(
    id: 6,
    images: [
      "asset/image/hotels/Pune/Hyatt/Hyatt1.jpg",
      "asset/image/hotels/Pune/Hyatt/Hyatt2.jpg",
      "asset/image/hotels/Pune/Hyatt/Hyatt3.jpg",
      "asset/image/hotels/Pune/Hyatt/Hyatt4.jpg"
    ],
    Rimages: "asset/image/hotels/Pune/Hyatt/Hyatt3.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hyatt Place Pune-Hinjawadi",
    address: "Hinjewadi, Pune.",
    price: 8000,
    disPrice: 7800,
    Acprice: 7999,
    description:
        "Conveniently situated in the Hinjawadi part of Pune, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Dagadusheth Halwai Ganapati Temple. This 4-star property features restaurant to make your stay more indulgent and memorable.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/JJu8zJuXsJWcJYud8",
    city: "Pune",
  ),
  Hotel(
    id: 7,
    images: [
      "asset/image/hotels/Pune/Ritz/Ritz1.jpg",
      "asset/image/hotels/Pune/Ritz/Ritz2.jpg",
      "asset/image/hotels/Pune/Ritz/Ritz3.jpg",
      "asset/image/hotels/Pune/Ritz/Ritz4.jpg"
    ],
    Rimages: "asset/image/hotels/Pune/Ritz/Ritz3.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "The Ritz Carlton Pune",
    address: "Yerawada, Pune.",
    price: 19299,
    disPrice: 15299,
    Acprice: 15499,
    description:
        "The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Pune Airport part of Pune, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Dagadusheth Halwai Ganapati Temple. Rated with 5 stars, this high-quality property provides guests with access to massage, restaurant and fitness center on-site.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/q9A43LgJQzbJ1y617",
    city: "Pune",
  ),
  //
  //
  /* Hotel list Mumbai */
  //
  //
  Hotel(
    id: 8,
    images: [
      "asset/image/hotels/Mumbai/courtYards/courtyardM1.jpg",
      "asset/image/hotels/Mumbai/courtYards/courtyardM2.jpg",
      "asset/image/hotels/Mumbai/courtYards/courtyardM3.jpg",
      "asset/image/hotels/Mumbai/courtYards/courtyardM4.jpg"
    ],
    Rimages: "asset/image/hotels/Mumbai/courtYards/courtyardM4.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Courtyard by Marriott Mumbai Int. Airport",
    address: "Near Mumbai Airport, Mumbai.",
    price: 23180,
    disPrice: 14000,
    Acprice: 14499,
    description:
        "Get your trip off to a great start with a stay at this property, which offers car park free of charge. Strategically situated in Andheri East, allowing you access and proximity to local attractions and sights. Don't leave before paying a visit to the famous Gateway of India. Rated with 5 stars, this high-quality property provides guests with access to massage, restaurant and fitness center on-site.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/Cc3VFJqEbdGKTQct6",
    city: "Mumbai",
  ),
  Hotel(
    id: 9,
    images: [
      "asset/image/hotels/Mumbai/oberoi/oberoi1.jpg",
      "asset/image/hotels/Mumbai/oberoi/oberoi2.jpg",
      "asset/image/hotels/Mumbai/oberoi/oberoi3.jpg",
      "asset/image/hotels/Mumbai/oberoi/oberoi4.jpg"
    ],
    Rimages: "asset/image/hotels/Mumbai/oberoi/oberoi4.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "The Oberoi, Mumbai",
    address: "Marine Drive, Mumbai.",
    price: 28514,
    disPrice: 20000,
    Acprice: 20399,
    description:
        "Conveniently situated in the South Mumbai part of Mumbai, this property puts you close to attractions and interesting dining options. Don't leave before paying a visit to the famous Gateway of India. Rated with 5 stars, this high-quality property provides guests with access to massage, restaurant and fitness center on-site.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/Vwc5LJKjRVLmEdJB6",
    city: "Mumbai",
  ),
  Hotel(
    id: 10,
    images: [
      "asset/image/hotels/Mumbai/tajHotel/Taj1.jpeg",
      "asset/image/hotels/Mumbai/tajHotel/Taj2.jpg",
      "asset/image/hotels/Mumbai/tajHotel/Taj3.jpg",
      "asset/image/hotels/Mumbai/tajHotel/Taj4.jpg"
    ],
    Rimages: "asset/image/hotels/Mumbai/tajHotel/Taj4.jpg",
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "The Taj Mahal Palace, Mumbai",
    address: "Colaba, Mumbai.",
    price: 54074,
    disPrice: 30000,
    Acprice: 33499,
    description:
        "The Taj Mahal Palace opened in Mumbai, then Bombay, in 1903, giving birth to the country’s first harbour landmark. The recently trademarked flagship hotel overlooks the majestic Gateway of India. This legendary hotel in Mumbai has played host to kings, dignitaries and eminent personalities from across the globe, and is acknowledged as a world leader in hospitality. Each of the rooms 285 rooms & suites are a striking blend of nostalgic elegance, rich history and modern facilities. Strategically located in Mumbai’s prime historical and commercial hub, The Taj Mahal Palace is walking distance from Colaba Causeway, known for its touristy tiny roadside shops.",
    rating: 4.1,
    isFavourite: true,
    location: "https://maps.app.goo.gl/KWWQfKdmKe3wZqok9",
    city: "Mumbai",
  ),
];
