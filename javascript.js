function convertForUIListToArray () {
    

    var htmlstring = '<ul><li>Password can not be blank</li><li>Password cannot be less than 8 symbols</li><li>Password should contain at least one lower case letter</li><li>Password should contain at least one upper case letter</li><li>Password should contain at least one digit</li></ul>';
              
    var arr = [];

    $(htmlstring).children().each(function(_, node) {
         arr.push(node.textContent);
    });

    console.log("!!!!!!");
    console.log("!!!!!!!!");
    console.log(arr);

}