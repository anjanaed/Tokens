async function main() {
    const Audi = await ethers.getContractFactory("Audi");

    const Audi_ = await Audi.deploy();
    console.log("Contract Address: ",Audi_.address);


    
}

main()
.then(()=> process.exit(0))
.catch(error=>{
    console.log(error);
    process.exit(1);
});