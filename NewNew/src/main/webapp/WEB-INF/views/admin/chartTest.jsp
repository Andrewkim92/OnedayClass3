<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1 align=center>프로그램 좋아요 순위</h1>
<canvas id="logChart" width="200px" height="100px"></canvas>

<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script>

var ctx = document.getElementById("logChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["1위", "2위","3위","4위","5위","6위","7위","8위","9위"],
        datasets: [{
            data: ['${firstToTenth.get(0).getProgLikeCount()}', '${firstToTenth.get(1).getProgLikeCount()}'
            	, '${firstToTenth.get(2).getProgLikeCount()}', '${firstToTenth.get(3).getProgLikeCount()}'
            	, '${firstToTenth.get(4).getProgLikeCount()}', '${firstToTenth.get(5).getProgLikeCount()}'
            	, '${firstToTenth.get(6).getProgLikeCount()}', '${firstToTenth.get(7).getProgLikeCount()}'
            	, '${firstToTenth.get(8).getProgLikeCount()}', '${firstToTenth.get(9).getProgLikeCount()}'], //컨트롤러에서 모델로 받아온다.
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 35, 0.2)',
                'rgba(84, 162, 135, 0.2)',
                'rgba(24, 162, 225, 0.2)',
                'rgba(14, 72, 115, 0.2)',
                'rgba(34, 12, 95, 0.2)',
                'rgba(214, 162, 25, 0.2)',
                'rgba(74, 62, 75, 0.2)'

            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(154, 132, 235, 1)',
                'rgba(24, 121, 235, 1)',
                'rgba(34, 222, 235, 1)',
                'rgba(44, 212, 235, 1)',
                'rgba(54, 32, 235, 1)',
                'rgba(64, 22, 235, 1)',
                'rgba(74, 62, 235, 1)'

            ],
            borderWidth: 1
        }
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
