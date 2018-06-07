<%-- 
    Document   : admin
    Author     : ivan
--%>
<%@page import="it.unitn.disi.cinema.dataaccess.Beans.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page import="java.util.StringTokenizer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cinema.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Zona Admin - programmazioni</title>
    </head>
    <jsp:include page='components/header.jsp'/>

    <body class="collage">
		
                <div class="col-12">
                        <div id="seat-map">
                            <div class="front-indicator">Schermo</div>
                        </div>
                </div>


    <jsp:include page='components/footer.jsp'/>
    </body>

 <script>
                                        var firstSeatLabel = 1;
                                        $(document).ready(function() {


                                        //Test Domenico Stefani
                                        var mappa = $("body").attr("data-mappa");
                                        var reserved = $("body").attr("data-reserved-list");
                                        //alert("La mappa è " + mappa + "\nE la lista è " + reserved);  

                                        var $cart = $('#selected-seats'),
                                                $counter = $('#counter'),
                                                $total = $('#total'),
                                                sc = $('#seat-map').seatCharts({
                                        map: mappa.split(","),
                                                seats: {
                                                    a: {
                                                        price   : 10,
                                                        classes : 'first-class', //your custom CSS class
                                                        category: 'Libero'
                                                    },
                                                },
                                                naming : {
                                                    top : false,
                                                        getLabel : function (character, row, column) {
                                                        return firstSeatLabel++;
                                                        },
                                                },
                                                legend : {
                                                node : $('#legend'),
                                                        items : [
                                                        [ 'a', 'available', 'Posti disponibili' ],
                                                        [ 'a', 'unavailable', 'Posti occupati']
                                                        ]
                                                },
                                                click: function () {
                                                if (this.status() == 'available') {
                                                //let's create a new <li> which we'll add to the cart items
                                                $('<li>Posto N: ' + this.settings.label + ' - ' + this.data().category + '  <a href="#" class="cancel-cart-item">[annulla]</a></li>')
                                                        .attr('id', 'cart-item-' + this.settings.id)
                                                        .data('seatId', this.settings.id)
                                                        .appendTo($cart);
                                                /*
                                                 * Lets up<a href="https://www.jqueryscript.net/time-clock/">date</a> the counter and total
                                                 *
                                                 * .find function will not find the current seat, because it will change its stauts only after return
                                                 * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
                                                 */
                                                $counter.text(sc.find('selected').length + 1);
                                                $total.text(recalculateTotal(sc) + this.data().price);
                                                return 'selected';
                                                } else if (this.status() == 'selected') {
                                                //update the counter
                                                $counter.text(sc.find('selected').length - 1);
                                                //and total
                                                $total.text(recalculateTotal(sc) - this.data().price);
                                                //remove the item from our cart
                                                $('#cart-item-' + this.settings.id).remove();
                                                //seat has been vacated
                                                return 'available';
                                                } else if (this.status() == 'unavailable') {
                                                //seat has been already booked
                                                return 'unavailable';
                                                } else {
                                                return this.style();
                                                }
                                                }

                                        });
                                        //this will handle "[cancel]" link clicks
                                        $('#selected-seats').on('click', '.cancel-cart-item', function () {
                                        //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                                        sc.get($(this).parents('li:first').data('seatId')).click();
                                        });
//			$('#selected-seats').animate({
//				scrollTop: $("#selected-seats").offsetHeight()+$("#selected-seats").offsetTop();
//		
//			});
                                        //let's pretend some seats have already been booked //Modificato Domenico Stefani
                                        var reserved_split = reserved.split(",");
                                        sc.get(reserved_split).status('unavailable');
                                        });
                                        function recalculateTotal(sc) {
                                        var total = 0;
                                        //basically find every selected seat and sum its price
                                        sc.find('selected').each(function () {
                                        total += this.data().price;
                                        });
                                        return total;
                                        }
        </script>

        <script>
            // requires <a href="https://www.jqueryscript.net/tags.php?/jQuery UI/">jQuery UI</a>
            animate : false,
                    // specify your own column and row labels as well as functions for generating seat ids and labels
                    naming  : {
                    top    : true,
                            left   : true,
                            getId  : function(character, row, column) {
                            return row + '_' + column;
                            },
                            getLabel : function (character, row, column) {
                            return column;
                            }

                    },
                    // custom legend
                    legend : {
                    node   : null,
                            items  : []
                    },
                    // click function
                    click   : function() {

                    if (this.status() == 'available') {
                    return 'selected';
                    } else if (this.status() == 'selected') {
                    return 'available';
                    } else {
                    return this.style();
                    }

                    },
                    // focus function
                    focus  : function() {

                    if (this.status() == 'available') {
                    return 'focused';
                    } else  {
                    return this.style();
                    }
                    },
                    // blur function
                    blur   : function() {
                    return this.status();
                    },
                    // seat map definition
                    seats   : {}


        </script>
        <script>
            function setValue(hiddenInput){
            $("li[id^='cart-item']").each(function(){
            hiddenInput.value += $(this).attr('id').substr(9, ) + "!";
            });
            }
        </script>	
</html>