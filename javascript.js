function convertForUIListToArray () {
    

    var htmlstring = '<ul><li>Password can not be blank</li><li>Password cannot be less than 8 symbols</li><li>Password should contain at least one lower case letter</li><li>Password should contain at least one upper case letter</li><li>Password should contain at least one digit</li></ul>';
              
    var arr = [];

    $(htmlstring).children().each(function(_, node) {
         arr.push(node.textContent);
    });

    console.log("!!!!!!");
    console.log("!!!!!!!!");
    console.log(arr);
    
    // http://encosia.com/use-jquery-to-extract-data-from-html-lists-and-tables/
    // http://javascript.ru/forum/jquery/28620-najjti-kolichestvo-ehlementov-spiska.html
    // var res = html.map(function() {
    //   // For each <li> in the list, return its inner text and let .map()
    //   //  build an array of those values.
    //   return $(this).text();
    // }).get();
    

}