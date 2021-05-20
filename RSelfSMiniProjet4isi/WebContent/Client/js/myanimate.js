const element_b = document.querySelector('.c-animate-boisson');
		element_b.addEventListener("mouseover", () => {
			console.log("mouse is entered")
			element_b.classList.add('animate__animated', 'animate__fadeIn');
			});
		element_b.addEventListener("mouseleave", () => {
			console.log("mouse is leaving")
			element_b.classList.remove('animate__animated', 'animate__fadeIn');
			});
		const element_p = document.querySelector('.c-animate-plat');
		element_p.addEventListener("mouseover", () => {
			console.log("mouse is entered")
			element_p.classList.add('animate__animated', 'animate__fadeIn');
			});
		element_p.addEventListener("mouseleave", () => {
			console.log("mouse is leaving")
			element_p.classList.remove('animate__animated', 'animate__fadeIn');
			});
		const element_d = document.querySelector('.c-animate-dessert');
		element_d.addEventListener("mouseover", () => {
			console.log("mouse is entered")
			element_d.classList.add('animate__animated', 'animate__fadeIn');
			});
		element_d.addEventListener("mouseleave", () => {
			console.log("mouse is leaving")
			element_d.classList.remove('animate__animated', 'animate__fadeIn');
			});