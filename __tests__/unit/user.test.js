const bcrypt = require("bcrypt");
const truncate = require("../utils/truncate");
const { User } = require("../../src/app/models");
describe("User", ( ) => {
    beforeEach(async()=> {
        await truncate();
    });
    it("Must encrypt user password", async () => {
        const user = await User.create({ full_name: "joao", email: "joao@gmail.com", avatar_url: "fasd", is_free_plan: 1, password: "12345678" });
        expect(await bcrypt.compare("12345678", user.password_hash)).toBe(true);
    });
});