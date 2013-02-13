{# 
Description: Product category page
#}

{% extends 'base.tpl' %}

{% block content %}

	<ul class="breadcrumb">
		<li><a href="/">Home</a><span class="divider">›</span></li>
		<li class="active">{{ category.title }}</li>
	</ul>

	<h1>{{ category.title }}</h1>
	<p>{{ category.description }}</p>
	<hr>

	<div class="row products">
		
		{% for product in products("order:title category:#{category.id} limit:9") %} 
			  		
			<div class="span3 product">
				<a href="{{ product.url }}"><img src="{{ product.image.full }}" alt="{{ product.title }}" title="{{ product.title }}"></a>
				<div class="box">
					<h3><a href="{{ product.url }}">{{ product.title }}</a></h3>
					
					<p>{{ product.description_short }}</p>
					
					<span class="price">
						
					{% if product.promo == true %}
						<del>&euro; {{ product.price }}</del> &nbsp; &euro;  {{ product.price_promo }}
					{% else %}
						&euro;  {{ product.price }}
					{% endif %}
					
					</span>
				</div>
			</div>
			
		{% else %}
		
			<div class="span9 product">
				<h5>Não existem produtos.</h5>
			</div>
		
		{% endfor %}
		
		<div class="span9 product">
				
			<hr>
				
			{{ pagination("category:#{category.id} limit:9") }}
				
		</div>
		
		
		    				    		
	</div>



{% endblock %}