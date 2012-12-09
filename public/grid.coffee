ds = new kendo.data.DataSource
  transport:
    read: "/orders"
  serverPaging: true
  pageSize: 5

grid = $("#grid").kendoGrid()

