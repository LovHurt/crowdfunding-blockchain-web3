async function main() {
    // Contract Factory'ı alıyoruz
    const CrowdFunding = await ethers.getContractFactory("CrowdFunding");
  
    // Kontratı deploy ediyoruz
    const crowdFunding = await CrowdFunding.deploy();
  
    // ethers.js v6: waitForDeployment() ile deploy işleminin tamamlanmasını bekleyin
    await crowdFunding.waitForDeployment();
  
    // ethers v6'da kontrat adresi "target" ile erişiliyor
    console.log("CrowdFunding deployed to:", crowdFunding.target);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  