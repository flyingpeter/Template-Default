{# 
Description: Complete order page
#}

{% extends 'base.tpl' %}

{% block content %}
	
	<ul class="breadcrumb">
		<li><a href="/">Home</a><span class="divider">›</span></li>
		<li class="active">Encomenda registada</li>
	</ul>
	
	<h1>Encomenda registada</h1>		
	<br>
	
	<p><strong>Obrigado {{ user.name }},</strong></p>
	<p>A sua encomenda foi registada com sucesso com o número: <strong>{{ order.id }}</strong></p>
	<p>{{ order.msg_payment }}</p>
	
	{% if order.payment == 'Multibanco' %}
		
		<br>
		
		{% if order.multibanco is defined  %}
		
			<div class="well">
				<h4>Dados para pagamento Multibanco</h4>
				<br>
				<p><strong>Entidade:</strong> <span class="muted">{{ order.multibanco.entity }}</span></p>
				<p><strong>Referência:</strong> <span class="muted">{{ order.multibanco.reference }}</span></p>
				<p><strong>Montante:</strong> <span class="muted">{{ order.multibanco.value | money_with_sign }}</span></p>
				<hr>
				<p><small>As referências multibanco são geradas pela <a target="_blank" href="https://www.easypay.pt/pt/aderir/shopkit">Easypay</a>.</small></p>
			</div>
		
		{% else %}
		
			<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<h5>Erro</h5>
				<p>De momento não  é possível utilizar o método de pagamento Multibanco.</p>
			</div>
		
		{% endif %}
		
	{% endif %}
	
{% endblock %}