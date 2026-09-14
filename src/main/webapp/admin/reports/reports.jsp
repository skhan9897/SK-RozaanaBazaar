<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h2 class="font-weight-bold text-dark"><i class="fa-solid fa-chart-line mr-2 text-primary"></i> Analytics & Order Reports</h2>
    </div>

    <div class="row font-weight-bold text-center mb-4">
        <div class="col-md-3 mb-2"><div class="card p-3 border-0 shadow-sm" style="border-bottom: 3px solid #007bff !important;">Today's Sales <br><span class="h4 text-primary">₹18,450</span></div></div>
        <div class="col-md-3 mb-2"><div class="card p-3 border-0 shadow-sm" style="border-bottom: 3px solid #28a745 !important;">Weekly Sales <br><span class="h4 text-success">₹1,24,000</span></div></div>
        <div class="col-md-3 mb-2"><div class="card p-3 border-0 shadow-sm" style="border-bottom: 3px solid #ffc107 !important;">Monthly Sales <br><span class="h4 text-warning">₹5,45,000</span></div></div>
        <div class="col-md-3 mb-2"><div class="card p-3 border-0 shadow-sm" style="border-bottom: 3px solid #17a2b8 !important;">Yearly Sales <br><span class="h4 text-info">₹18,45,000</span></div></div>
    </div>

    <div class="row">
        <div class="col-md-8 mb-4">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white font-weight-bold">
                    <i class="fa-solid fa-map-location-dot mr-2 text-danger"></i> Sales Distribution by State (India)
                </div>
                <div class="card-body">
                    <div id="india_map" style="width: 100%; height: 500px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white font-weight-bold">
                    <i class="fa-solid fa-list-ol mr-2 text-success"></i> Top Performing States
                </div>
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="bg-light small">
                            <tr><th>State</th><th>Orders</th></tr>
                        </thead>
                        <tbody>
                            <c:forEach var="entry" items="${stateData}">
                                <tr>
                                    <td>${entry.key}</td>
                                    <td><span class="badge badge-primary badge-pill">${entry.value}</span></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty stateData}">
                                <tr><td colspan="2" class="text-center text-muted py-4 small">No data available</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {
        'packages':['geochart'],
    });
    google.charts.setOnLoadCallback(drawRegionsMap);

    function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
            ['State', 'Orders'],
            <c:forEach var="entry" items="${stateData}">
                ['${entry.key}', ${entry.value}],
            </c:forEach>
            // Fallback dummy data if empty to show the map
            <c:if test="${empty stateData}">
                ['Uttar Pradesh', 0], ['Maharashtra', 0], ['Bihar', 0], ['West Bengal', 0],
                ['Madhya Pradesh', 0], ['Tamil Nadu', 0], ['Rajasthan', 0], ['Karnataka', 0],
                ['Gujarat', 0], ['Andhra Pradesh', 0], ['Odisha', 0], ['Telangana', 0],
                ['Kerala', 0], ['Jharkhand', 0], ['Assam', 0], ['Punjab', 0], ['Chhattisgarh', 0],
                ['Haryana', 0], ['Delhi', 0], ['Jammu and Kashmir', 0], ['Uttarakhand', 0],
                ['Himachal Pradesh', 0], ['Tripura', 0], ['Meghalaya', 0], ['Manipur', 0],
                ['Nagaland', 0], ['Goa', 0], ['Arunachal Pradesh', 0], ['Mizoram', 0], ['Sikkim', 0]
            </c:if>
        ]);

        var options = {
            region: 'IN',
            displayMode: 'regions',
            resolution: 'provinces',
            colorAxis: {colors: ['#e7f0ff', '#007bff']},
            backgroundColor: '#ffffff',
            datalessRegionColor: '#f8f9fa',
            defaultColor: '#f8f9fa',
        };

        var chart = new google.visualization.GeoChart(document.getElementById('india_map'));
        chart.draw(data, options);
    }
</script>

<%@ include file="../includes/footer.jsp" %>
