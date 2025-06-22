### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 4a2b344a-c98f-48f1-a618-c1eda2a5db5e
md"# Der Zwischenwertsatzes"

# ╔═╡ c31d78cd-7e8e-4786-8fbf-4a8b5c77c783
md"Der Beweis des Zwischenwertsatzes enthält ein Verfahren, um z.B. Gleichung zu lösen oder auch Umkehrfunktionen zu berechen. Wir wollen diesen Algorithmus hier implementieren. Die folgende Funktion berechnet eine Intervallschachtelung, die eine Wert x zwischen a and b bestimmt mit f(x)=c.  Dabei wird vorausgesetzt, dass die Bedingungen des Zwischenwertsatzes erfüllt sind."

# ╔═╡ 4715469e-8d3c-11ee-39e3-f1a02b077d1f
function MeanValueTheorem(a,b,c,f,n)
	# Setze m =0
	
	m=0
	
	# Wir testen, ob f(a) <= 0 <= f(b). In diesem Fall konstruieren wir eine Intervallschachtelung wie in der Vorlesung durch sukzessive Halbierung des Intervalls.
	
	if (f(a) <= c <= f(b))
		for i in 1:n
			m= (a+b)/2
			if (c <= f(m))
				b=m
			else
				a=m
			end
			println(a,"   ",b)
		end
		return m
	elseif(f(a) >= c >= f(b))
		
		# Falls die Intervallgrenzen anders geordnet sind, vertauschen wir schlicht a und b
		
		return MeanValueTheorem(b,a,c,f,n)
	else
		
		# In diesem Fall ist c kein Zwischenwert!
		
		println("Not a mean value!")
	end
end

# ╔═╡ 05458e85-470c-4c73-b845-c05627ccb4f8
md"Verwenden wir gleich einmal dieses Verfahren, um eine Nullstelle von $\sin$ zwischen 2 und 4 zu bestimmen. Dammit haben wir einen ersten Algorithmus, um  $\pi$ zu berechnen. Leider konvergiert der sehr langsam."

# ╔═╡ de4da69a-2a54-41f4-ae6e-99573b0fa9d0
MeanValueTheorem(2,4,0,sin,10)

# ╔═╡ Cell order:
# ╟─4a2b344a-c98f-48f1-a618-c1eda2a5db5e
# ╟─c31d78cd-7e8e-4786-8fbf-4a8b5c77c783
# ╠═4715469e-8d3c-11ee-39e3-f1a02b077d1f
# ╟─05458e85-470c-4c73-b845-c05627ccb4f8
# ╠═de4da69a-2a54-41f4-ae6e-99573b0fa9d0
