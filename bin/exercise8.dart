library exercise8;

import 'dart:math';

part 'ex08_var.dart';


sentenceCreator(var listOfWords, var numberOfSentence){
  print('--- q1 ---');
  var rGen = new Random();
  var minWords = 3;
  var maxWords = 6;
  for(var i = 1; i <= numberOfSentence; i++){
    var sentence = '';
    var sentenceLength = minWords + rGen.nextInt(maxWords - minWords +1);
    for(var j = 0; j < sentenceLength; j++){
      sentence += listOfWords[rGen.nextInt(listOfWords.length)] + ' ';
    }
    print(sentence);
  }
  print('');
}



sortByLastName(var members){
  members.sort((x, y) => x['lastName'].compareTo(y['lastName']));
  print('--- q2 : sort by last name ---'); printMatrix(members); print('');
}

sortByFirstName(var members){
  members.sort((x, y) => x['firstName'].compareTo(y['firstName']));
  print('--- q2 : sort by first name ---');printMatrix(members);print('');
}


printByGivenLetter(var members, var letter){
  print('--- q2 : print member with last name starting with : $letter ---');
  for(var i in members){
    if(i['lastName'][0] == letter)
      print(i);}
  print('');
}


addMember(var associationName, var firstName, var lastName, var email, var memberList){
  memberList.add({
    'association': associationName,
    'firstName': firstName,
    'lastName': lastName,
    'email': email});
  print('--- q3 : add a member : $firstName $lastName ---'); printMatrix(memberList); print('');
}

removeMember(var firstName, var lastName, var memberList){
  for(var i = 0; i < memberList.length; i++){
    if(memberList[i]['firstName'] == firstName && memberList[i]['lastName'] == lastName){
      memberList.removeAt(i);}}
  print('--- q3 : remove a member : $firstName $lastName ---'); printMatrix(memberList); print('');
}


updateMember(var associationName, var firstName, var lastName, var email, var memberList){
  for(var i = 0; i < memberList.length; i++){
    if(memberList[i]['firstName'] == firstName && memberList[i]['lastName'] == lastName){
      memberList[i]['association'] = associationName;
      memberList[i]['firstName'] = firstName;
      memberList[i]['lastName'] = lastName;
      memberList[i]['email'] = email; }}
  print('--- q3 : update member : $firstName $lastName ---'); printMatrix(memberList); print('');
}

findGroups(var mat){
  var possibleGroupIDs = 'abcdefghijklmnopqrstuvwxyz';
  var index = 0;
  var currentGroupID = possibleGroupIDs[index];
  var boolMat = createFilledBoolMatrix(mat[0].length, mat.length, false);
  printMatrix(mat); print('');

  for(var i = 0; i < mat.length; i++){
    for(var j = 0; j < mat[i].length; j++){
      if(mat[i][j] == '1'){
        findAdjacence(i ,j, mat, boolMat, currentGroupID);
        index++;
        currentGroupID = possibleGroupIDs[index];}}}


  printMatrix(mat); print('');
}

findAdjacence(var i, var j, var matrice, var bMatrice, var groupID){
  if(    0 <= i && i < matrice.length
      && 0 <= j && j < matrice[0].length){
    if(bMatrice[i][j] == false){
      bMatrice[i][j] = true;
      if(matrice[i][j] == '1'){
        matrice[i][j] = groupID;
        findAdjacence(i-1, j-1, matrice, bMatrice, groupID);
        findAdjacence(i-1, j,   matrice, bMatrice, groupID);
        findAdjacence(i-1, j+1, matrice, bMatrice, groupID);
        findAdjacence(i,   j-1, matrice, bMatrice, groupID);
        findAdjacence(i,   j+1, matrice, bMatrice, groupID);
        findAdjacence(i+1, j-1, matrice, bMatrice, groupID);
        findAdjacence(i+1, j,   matrice, bMatrice, groupID);
        findAdjacence(i+1, j+1, matrice, bMatrice, groupID);}}}
}

void main(){
  //sentenceCreator(listeDeMots, nombreDePhrase);
  sentenceCreator(q1Mots, 10);

  sortByLastName(q2Members);
  sortByFirstName(q2Members);
  printByGivenLetter(q2Members, 'K');

  //addMember(association(s), prénom, nomFamille, e-mail, listeDeMembres);
  addMember('HPA', 'Max', 'Power', 'MP@gmail.com', q2Members);
  //removeMember(prénom, nomFamille, listeDeMembres);
  removeMember('Bob', 'Sley', q2Members);
  //updateMember(association(s), prénom, nomFamille , email , listeDeMembres);
  updateMember(['SPA', 'AOFI'], 'Buzz', 'Killington' , 'iddqd@aol.com' , q2Members);

  findGroups(q4);

}