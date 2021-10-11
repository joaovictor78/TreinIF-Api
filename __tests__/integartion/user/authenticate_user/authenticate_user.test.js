const { User } = require("../../../../src/app/models");
const truncate = require("../../../utils/truncate");
const request = require("supertest");
const app = require("../../../../src/app");
describe("Authenticate User", () => {
    beforeEach(
        async () => {
            await truncate();
        }
    );
    it("Shoud return user if credentials is valid", async () => {
        const params = { full_name: "joao", email: "joao@gmail.com", avatar_url: "fasd", is_free_plan: 1, password: "121jasdfiajsid" };
        const user = await User.create(params);
        const loggedUser = await request(app).post('/login').send({email: params.email, password: params.password});
        expect(loggedUser.status).toBe(200);
    });
});