// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");

$.ajax({
    url : 'Battery.do',
    dataType: 'json',
	success : function(res){		
		console.log(res);
		
		//배터리 충전량
	    charged = res.bt_charge;
		uncharged = res.bt_uncharge;
		console.log(charged);
		console.log(uncharged);
		
		battery_info = res.bt_info;
					
		var myPieChart = new Chart(ctx, {
			  type: 'doughnut',
			  data: {
			    labels: ["충전", "방전"],
			    datasets: [{
			      data: [charged, uncharged],
			      backgroundColor: ['#1cc88a', '#f6c23e'],
			      hoverBackgroundColor: ['#36b9cc', '#e74a3b'],
			      hoverBorderColor: "rgba(234, 236, 244, 1)",
			    }],
			  },    
			  options: {
			    maintainAspectRatio: false,
			    tooltips: {
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			    },
			    legend: {
			      display: false			      
			    },
			    cutoutPercentage: 50
			  }  
			});

	}
});


