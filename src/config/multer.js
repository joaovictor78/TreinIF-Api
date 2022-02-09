const multer = require("multer");
const multerFirebaseStorage = require('multer-firebase-storage')
const path = require("path");
const crypto = require("crypto");

const storageTypes = {
  local: multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, path.resolve(__dirname, "..", "..", "tmp", "uploads"));
    },
    filename: (req, file, cb) => {
      crypto.randomBytes(16, (err, hash) => {
        if (err) cb(err);

        file.key = `${hash.toString("hex")}-${file.originalname}`;

        cb(null, file.key);
      });
    }
  }),
  remote: multerFirebaseStorage({
        bucketName: 'treinif-app.appspot.com',
        public: true,
        unique: true,
        credentials: {
          clientEmail: "firebase-adminsdk-o2313@treinif-app.iam.gserviceaccount.com",
          privateKey: "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCohZ4v3vqFFHLB\n+uovCZes57p3fRSA8jugx+9bUd1VAFmY+smSh6JhnzCnzJZcsWEggDs1vQYcxUag\nC3OrzFZ3VgHBnQZnFM5OvK/VPlaJU0j6WiI2ZXTn/Md82dTN6aeU/6h0cXCNDJ/C\nYrZYkgvQ5qHBHhLevBCelsPHDJlTQrEq4Ih23Lr7Q/qROZqnPzbFFmjINKXBjMBm\nsZRQ+hy/+DeMDbvLXSReYMge/kEfr1663DX1/DNYyMtOMgMbs7T9OnqMAFu6EVpM\nU5fHccSFsygt70mxNaeIsuBv3z6rE7xAb5UYtULeBVaf3TdFwyteF+MeX2GqhIPB\nZRz2pet5AgMBAAECggEAFYNFKoBGWSG/SpMLkn32KQJF9AX5eEKJU8uM0Iq2p1Ni\n8galynkFGig2ZQgBc+DIRjFdyEzn5a6rXDf0srbkR4SpDGciukWrgTKmJvc3wye+\nIQjLkEfLBj28gOwqiy9rj2JERg/LLz5a0KJFpoXc+0nN1rd474pw0VtBWnzPFT6G\nK8WrSzg2N8mnFap+vUp4fwb898ZGHFwZoabnb7YFpAaW3vre7BoFIH+S0mDwxxLQ\njARhC7qzrXyAk92Uo91owsKgTYLg2n9yWbillbWFpCyWLLjpvRk0rxDX9lSv+hmS\nEVv71Z1+xEFrOADdGQ8Qan/TSrHB6IPbbQC/fLY0lwKBgQDkb9I/qYJuPpDOEzUD\nW0b3M2aMtKyZurqtfjGAdbCZNPMJH2GwpbBG4Y5m8oe/201ip+bjZ1OQBC0Z18pf\nhOBxvehr1zwTF+5+3/ZV9vNrAJg5I52I92Fao/BP97aErzFcKDd5gsDeM24MXhEy\nCqSZNaFbtxbpU5pCkRncvmQIrwKBgQC82xaN7gCNsyGfC/tJXIcdCFeDnt5oPoFP\n3/4ZQP2jCeIxrRYvj7Q+K8nRNwmFMELDsyIg2vikoVyCLiOxWwB4McnxsZLhRbDw\np3eZVABm4XuoeUFCzHSy9wrW35NUo9aJ2Da5kAIe5acE2tJ9NrVIvOS77UGRF1oW\nUrfVURaIVwKBgDHpGKfeMmhB9UOBQND17YBvU5WkmB2Shd0IOGqXzDj9L6irmZ2N\n5gDmoUVu8igCE1td0f2XgtNxhiUiV84c6ykO1CxTv4VwciR4bIsFxNN5MskxNedK\nHZQ/Q29FcTR2TrOS+ePrpJYn6IB9QQaM+r+azyGJ1FCweoDW0S7AznxzAoGABJlh\nRzuQj+LY4sKr7/Fs6OwXFYF88RT0mTlfOsY2Zw4KkCMi8y2QuiLe21V3yeKO/a0T\nG7G5dGjpk9ID1IHe1Q6BWH12kj3cPUAWzYkaKWc8V7H8QOAxx1n0zZ7MO7dxthGp\n44L6Sj5VfuzFS39VktvmxhzVB++Fph2FlJBQ+CkCf2/ncCzq71t2vKSuE1s9qvQ0\noGO2sjOkU3efCI8KJjC/JodaWCXKWZZqucX3SQ830t+E+DwucO1c+DGcPjzRYmbd\nkfoNh4jIaDOKq7GvR3JN3EIe1oxW4dzDLhsa94C4PiFMZ/nqW72YipJpOpG/8JKE\ne4Sdy6g+bgpMONvGvYk=\n-----END PRIVATE KEY-----\n",
          projectId: 'treinif-app'
        }
      })
};

module.exports = {
  dest: path.resolve(__dirname, "..", "..", "tmp", "uploads"),
  storage: storageTypes.remote,
  limits: {
    fileSize: 2 * 1024 * 1024
  },
  fileFilter: (req, file, cb) => {
    const allowedMimes = [
      "image/jpeg",
      "image/pjpeg",
      "image/png",
      "image/gif"
    ];

    if (allowedMimes.includes(file.mimetype)) {
      cb(null, true);
    } else {
      cb(new Error("Invalid file type."));
    }
  }
};