version=$1
project="CheckoutEventLoggerKit"
jsonFile="$project.json"
xcframework="$project.xcframework"
zipFile="$version-$xcframework.zip"
zipFileURL="https://github.com/cko-payment-interfaces/checkout-sdk-event-logger-ios-release/raw/main/$zipFile"

# zip CheckoutEventLoggerKit for the new version
zip -r $zipFile $xcframework

# modify our CheckoutEventLoggerKit.json release file to include new binary
contents=`node <<EOF
// read file
var data = require('./${jsonFile}');

// add our version and zip file
data['$version'] = '$zipFileURL';

// output data
console.log(JSON.stringify(data));
EOF
`

echo $contents > $jsonFile
