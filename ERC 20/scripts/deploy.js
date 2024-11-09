async function main() {
    const MoraToken = await ethers.getContractFactory("MoraToken");

    const MoraToken_ = await MoraToken.deploy();
    console.log("Contract Address: ",MoraToken_.address);


    
}

main()
.then(()=> process.exit(0))
.catch(error=>{
    console.log(error);
    process.exit(1);
});