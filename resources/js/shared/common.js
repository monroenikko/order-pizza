import { toPlainObject } from "lodash";

export default {
    data() {
        return {
            pizzaDetails: {
                sizes: ['small', 'medium', 'large'],
                crusts: ['thin', 'thick', 'hand-tossed', 'deep dish'],
                types: [
                    'Hawaiian',
                    'Chicken Fajita',
                    'Pepperoni Feast',
                    'NYF',
                    'Manhattan Meat Lover',
                    'BBQ Chicken',
                    'Garden Special',
                    'Roasted and garlic Shrimp',
                    'Four Cheese',
                    'Patty Melt',
                    'custom'
                ],
                toppingAreas: {
                    0: 'Whole',
                    1: 'First-Half',
                    2: 'Second-Half'
                },
                maxCustomToppingAreas: 3,
                maxCustomToppingItemsPerArea: 12
            },
            errorMessages: {
                invalidFormat: 'Invalid PML format',
                noOrder: 'There is no order.',
                oneOrderPerSubmission: 'Only one order per submission is allowed.',
                noOrderNumber: 'No order number.',
                pizzaNumberOrder: 'Incorrect order of pizzas.',
                noSize: 'Please indicate pizza size.',
                oneSizePerPizza: 'Only one size per pizza.',
                invalidSize: 'Pizza size must be small, medium, or large.',
                noCrust: 'Please indicate pizza crust.',
                oneCrustPerPizza: 'Only one crust type per pizza.',
                invalidCrust: 'Pizza crust must be thin, thick, hand-tossed, or deep dish.',
                noType: 'Please indicate pizza type.',
                oneTypePerPizza: 'Only one type per pizza.',
                invalidType: 'Pizza type must be Hawaiian, Chicken Fajita, Pepperoni Feast, or custom.',
                noToppingsAllowedForPizzaType: 'Selected pizza type cannot have custom toppings.',
                maxCustomToppingAreas: '',
                maxCustomToppingItemsPerArea: '',
                invalidToppingArea: 'Topping area must be 0 (whole pizza), 1 (first-half), or 2 (second-half).'
            },
        }
    },
    methods: {
        validateOrder(order) {
            const xml = this.convertToXml(order);
            if (xml.getElementsByTagName('parsererror').length) {
                this.hasError = true
                return this.messageError.push(this.errorMessages.invalidFormat);
            }

            // check if order has number
            const orderTags = xml.getElementsByTagName('order');
            if (orderTags.length === 0) {
                this.hasError = true
                return this.messageError.push(this.errorMessages.noOrder);
            }

            const newOrder = orderTags[0];
            if (!newOrder.hasAttribute('number') || newOrder.getAttribute('number').trim() === '') {
                this.hasError = true
                return this.messageError.push(this.errorMessages.noOrderNumber);
            }

            const pizzas = newOrder.getElementsByTagName('pizza');
            for (let i = 0; i < pizzas.length; i++) {
                const pizza = pizzas[i];

                // check if pizza numbers are in order and starts at 1.
                if (parseInt(pizza.getAttribute('number')) !== i + 1) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.pizzaNumberOrder);
                }

                // check if size is small, medium, or large.
                const size = pizza.getElementsByTagName('size');
                if (size.length === 0) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.noSize);
                } else if (size.length > 1) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.oneSizePerPizza);
                }

                for (let j = 0; j < this.pizzaDetails.sizes.length; j++) {
                    if (this.pizzaDetails.sizes[j].toLowerCase() === size[0].textContent.toLowerCase()) {
                        break;
                    }

                    if (j === this.pizzaDetails.sizes.length - 1) {
                        this.hasError = true
                        return this.messageError.push(this.errorMessages.invalidSize);
                    }
                }

                // check if crust is thin, thick, hand-tossed, deep dish.
                const crust = pizza.getElementsByTagName('crust');
                if (crust.length === 0) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.noCrust);
                } else if (crust.length > 1) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.oneCrustPerPizza);
                }
                for (let j = 0; j < this.pizzaDetails.crusts.length; j++) {
                    if (this.pizzaDetails.crusts[j].toLowerCase() === crust[0].textContent.toLowerCase()) {
                        break;
                    }

                    if (j === this.pizzaDetails.crusts.length - 1) {
                        return this.errorMessages.invalidCrust;
                    }
                }

                // check if type
                const pizzaType = pizza.getElementsByTagName('type');
                if (pizzaType.length === 0) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.noType);
                } else if (pizzaType.length > 1) {
                    return this.messageError.push(this.errorMessages.oneTypePerPizza);
                }
                for (let j = 0; j < this.pizzaDetails.types.length; j++) {
                    if (this.pizzaDetails.types[j].toLowerCase() === pizzaType[0].textContent.toLowerCase()) {
                        break;
                    }

                    if (j === this.pizzaDetails.types.length - 1) {
                        this.hasError = true
                        return this.messageError.push(this.errorMessages.invalidType);
                    }
                }

                // check toppings.
                const toppingAreas = pizza.getElementsByTagName('toppings');
                if (pizzaType[0].textContent.toLowerCase() !== 'custom' && toppingAreas.length > 0) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.noToppingsAllowedForPizzaType);;
                } else if (toppingAreas.length > this.pizzaDetails.maxCustomToppingAreas) {
                    this.hasError = true
                    return this.messageError.push(this.errorMessages.maxCustomToppingAreas);
                }

                for (let j = 0; j < toppingAreas.length; j++) {
                    const toppingArea = toppingAreas[j];

                    // check if topping area is valid
                    if (!(parseInt(toppingArea.getAttribute('area')) in this.pizzaDetails.toppingAreas)) {
                        this.hasError = true
                        return this.messageError.push(this.errorMessages.invalidToppingArea);
                    }

                    const toppings = toppingArea.getElementsByTagName('item');
                    if (toppings.length > this.pizzaDetails.maxCustomToppingItemsPerArea) {
                        this.hasError = true
                        return this.messageError.push(this.errorMessages.maxCustomToppingItemsPerArea);
                    }
                }
            }
            return 'valid';
        },
        convertToXml(order) {
            order = order.replace(/{/g, '<').replace(/\\/g, '/').replace(/}/g, '>');

            const parser = new DOMParser();
            return parser.parseFromString(order, 'text/xml');
        }
    },
    created() {
        this.maxCustomToppingAreas = `Up to ${this.pizzaDetails.maxCustomToppingAreas} topping areas allowed.`;
        this.maxCustomToppingItemsPerArea = `Up to ${this.pizzaDetails.maxCustomToppingItemsPerArea} toppings per area allowed.`;
        this.invalidType = `Pizza type must be ${this.types}.`
    },

}