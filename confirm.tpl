{# 
Description: Confirm order page
#}

{% extends 'base.tpl' %}

{% block content %}
	
	<ul class="breadcrumb">
		<li><a href="/">Home</a><span class="divider">›</span></li>
		<li><a href="{{ site_url('cart') }}">Carrinho de Compras</a><span class="divider">›</span></li>
		<li><a href="{{ site_url('cart/data') }}">Dados de Envio</a><span class="divider">›</span></li>
		<li><a href="{{ site_url('cart/payment') }}">Pagamento e Transporte</a><span class="divider">›</span></li>
		<li class="active">Confirmação</li>
	</ul>
	
	<h1>Confirmação</h1>		
	<br>
	
	{% if errors.form %}
		<div class="alert alert-error">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<h5>Erro</h5>
			<p>{{ errors.form }}</p>
		</div>
	{% endif %}
	
	{% if cart.items %}
		
		{{ form_open('cart/complete', { 'class' : 'form' }) }}
			
			<table class="table table-bordered table-cart">
				<thead>
					<tr>
						<th>Título</th>
						<th>Quantidade</th>
						<th>SubTotal</th>
					</tr>
				</thead>
				
				<tbody>
					
					{% for item in cart.items %} 
						<tr>
							<td><img src="{{ item.image }}" width="22" height="22"> {{ item.title }}</td>
							<td class="text-right">{{ item.qty }}</td>
							<td class="price text-right">{{ item.subtotal | money_with_sign }}</td>
						</tr>
					{% endfor %}
					
				</tbody>
				
				<tfoot>
					
					{% if store.taxes_included == false and cart.taxes > 0 %}
					<tr>
						<td class="discount">Taxa / Imposto (<abbr title="Imposto sobre o valor acrescentado">IVA</abbr>)</td>
						<td align="right" class="discount price text-right" colspan="2">{{ cart.taxes | money_with_sign }}</td>
					</tr>
					{% endif %}
					
					<tr>
						<td class="discount">Portes de Envio</td>
						<td align="right" class="discount price text-right" colspan="2">{{ cart.total_shipping | money_with_sign }}</td>
					</tr>

					{% if cart.discount %}
						<tr>
							<td class="discount">Desconto</td>
							<td align="right" class="discount price text-right" colspan="2">- {{ cart.discount | money_with_sign }}</td>
						</tr>
					{% endif %}
					
					<tr>
						<td class="subtotal">Total Encomenda</td>
						<td colspan="2" class="subtotal price text-right">{{ cart.total | money_with_sign }}</td>
					</tr>
				</tfoot>
			</table>
			
			<hr>

			<div class="row">

				<div class="span4">
					<h4>Pagamento</h4>
					<br>
					<p>{{ user.payment }}</p>
				</div>
				
				{% if user.shipping_method %}
					<div class="span4 offset1">
						<h4>Transporte</h4>
						<br>
						<p>{{ user.shipping_method.title }}</p>
					</div>
				{% endif %}
				
			</div>
			
			<hr>
			
			<h4>Dados de Envio</h4>
			<br>
			
			<div class="row">
				
				<div class="span4">
					<strong>Nome</strong><br>{{ user.name }}<br><br>
					<strong>E-mail</strong><br>{{ user.email }}<br><br>
					<strong>Nr. Contribuinte</strong><br>{{ user.tax_id }}<br><br>
					<strong>Telefone</strong><br>{{ user.phone }}
				</div>
				
				<div class="span4 offset1">
					<strong>Morada</strong><br>{{ user.address }}<br><br>
					<strong>Código Postal</strong><br>{{ user.zip_code }}<br><br>
					<strong>Localidade</strong><br>{{ user.city }}<br><br>
					<strong>País</strong><br>{{ user.country }}
				</div>
				
			</div>

			<br>
			<strong>Observações</strong><br>{{ user.notes }}
			
			<hr>
			
			<button type="submit" class="btn btn-large">Confirmar Encomenda ›</button> &nbsp; &bull; &nbsp; <a href="{{ site_url('cart') }}">Editar Carrinho</a>
			
		{{ form_close() }}
			
	{% else %}
			
		<p class="text">Não existem produtos no carrinho.</p>
			
	{% endif %}
		
{% endblock %}