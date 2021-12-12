const { password } = require("../../../../../config/database");

module.exports = (data) => {
    const {name, email, password, photo_url, phone} = data;
    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
    function validatePassword(password){
        return password.length < 8;
    }
    if (!validateEmail(email) && !validatePassword(password)) {
        throw {message: "Invalid email format ans password are incorrect format"};
    }
    else if (!validateEmail(email)) {
        throw {message: "Invalid email format"};
    }

   else if (!validatePassword(password)) {
        throw {message: "The password must have at least 8 characters, 1 number, 1 uppercase letter and 1 lowercase letter"};
    }
}
