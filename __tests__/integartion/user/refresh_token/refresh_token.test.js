const truncate = require("../../../utils/truncate");
const { User } = require("../../../../src/app/models");
const request = require("supertest");
const app = require("../../../../src/app");
describe("Refresh Token", ()=>{
    beforeEach(
        async () => {
            await truncate();
        }
    );
    it("must return a new token if refresh token is valid", async () => {
        const params = { full_name: "joao", email: "joao@gmail.com", avatar_url: "fasd", is_free_plan: 1, password: "121jasdfiajsid" };
        await User.create(params);
        const loggedUser = await request(app).post('/login').send({email: params.email, password: params.password});
        const newToken = await request(app).post("/refresh-token").send({refresh_token: loggedUser.body.token.refresh_token});
        expect(newToken.status).toBe(200);
    }); 
}); 