class User {
  final String nickName;
  final String userName;
  final String email;
  final String passwordHash;
  final int userDataId;
  final String profilePhoto;
  final List watchList;
  final List finishedAnimes;

  //Construtor da classe
  User(
    this.nickName,
    this.userName,
    this.email,
    this.passwordHash,
    this.userDataId,
    this.profilePhoto,
    this.watchList,
    this.finishedAnimes,
  );
}
