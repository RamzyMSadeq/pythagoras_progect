//  String token = await SPHelper.spHelper.getToken();

//     var uri = Uri.parse(baseUrl + updateUserTraderUrl);
//     var request = new http.MultipartRequest("POST", uri);
//     var multipartFile = await http.MultipartFile.fromPath(
//       "image",
//       image.path,
//       filename: basename(image.path),
//     );
//     var multipartFileLogo = await http.MultipartFile.fromPath(
//       "logo",
//       logo.path,
//       filename: basename(logo.path),
//     );
//     request.files.add(multipartFile);
//     request.files.add(multipartFileLogo);
//     request.headers.addAll({
//       'Authorization': "Bearer $token",
//       HttpHeaders.acceptHeader: '*/*',
//     });

//     request.fields['name'] = name;
//     request.fields['email'] = email;
//     request.fields['mobile'] = mobile;
//     request.fields['market_category'] = categoreMarket;
//     request.fields['address'] = address;
//     request.fields['market_owner'] = marketOwner;
//     request.fields['state'] = state;
//     request.fields['city'] = city;
//     request.fields['open_times'] = openTime;

//     try {
//       StreamedResponse response = await request.send();
//       final respStr = await response.stream.bytesToString();
//       Map map = json.decode(respStr) as Map;

//       print(map);

//       return map;


//     } catch (e) {
//       print(e);
//       return null;
//     }