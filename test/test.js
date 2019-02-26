var Test = artifacts.require("./Test.sol");

let instance;
let accounts;
beforeEach(async () => {
    instance = await Test.deployed();
});

contract("Election", (accounts) => {
    accounts = accounts;
    // console.log(accounts);

    it('deploys contract', () => {
        assert.ok(instance.address);
    });

    it("skill_levels test", async () => {
        const a1 = await instance.getStats('ifti');
        console.log(a1[3]);
        // console.log(a1[3][0]);
        // console.log(a1[3][1]);
        assert.equal(11, a1[3][0].toNumber());
        assert.equal(22, a1[3][1].toNumber());
    });
});