import CoreXLSX
import CSV

guard CommandLine.arguments.count > 1,
let filepath = CommandLine.arguments.last,
let file = XLSXFile(filepath: filepath) else {
  fatalError("please pass path to XLSX from Toptal Payments to parse")
}

do {
  for path in try file.parseWorksheetPaths() {
    let ws = try file.parseWorksheet(at: path)
    for row in ws.sheetData.rows {
      for c in row.cells {
        print(c)
      }
    }
  }
} catch {
  print(error)
}
