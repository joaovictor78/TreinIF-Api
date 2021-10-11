const request = require('supertest');
const app = require("../../../../src/app");
const truncate = require("../../../utils/truncate");
describe("Register User", () => {
    beforeEach(
        async () => {
            await truncate();
        }
    );
    it("Must return the created user", async () => {
        const params = { full_name: "joao", email: "joao@gmail.com", avatar_url: "fasd", is_free_plan: 1, password: "121jasdfiajsid" };
        const user = await request(app).post('/register-user').send(params);
        expect(user.status).toBe(200);
    });
    
});
