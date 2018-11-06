import CoreXLSX

guard CommandLine.arguments.count > 1,
let filepath = CommandLine.arguments.last,
let file = XLSXFile(filepath: filepath) else {
  fatalError("please pass path to XLSX from Toptal Payments to parse")
}


for ws in try file.parseWorksheetPaths() {
  print(try file.parseWorksheet(at: ws))
}
