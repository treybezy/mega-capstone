var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Student Discounts",
      message2: "Create a new discount here",
      discounts: [],
      nameFilter: ""   
    };
  },
  created: function() {
    axios
    .get("/api/discounts")
    .then(function(response) {
      this.discounts = response.data;
    }.bind(this));
  },
  methods: {
    isValidDiscount: function(inputDiscount) {
      var validBrand = inputDiscount.brand.toLowerCase().includes(this.nameFilter.toLowerCase());
      return validBrand 
    },
    toggleMoreInfo: function(inputDiscount){
      console.log('made it')
      this.$set(inputDiscount, "descriptionVisible", !inputDiscount.descriptionVisible);
      // inputDiscount.discounted_priceVisible = !inputDiscount.discounted_priceVisible
      // inputDiscount.location.address = !inputDiscount.location.address;
    }
  },
  computed: {}
};


var DiscountNewPage = {
  template: "#discounts-new-page",
  data: function() {
    return {
      newDiscountBrand: "",
      newDiscountBio: "",
      newDiscountDiscount: "",
      errors: []
  };
},
created: function() {},
  methods: {
    addDiscount: function() {
        var clientParams = {
                          brand: this.newDiscountBrand,
                          description: this.newDiscountBio,
                          discounted_price: this.newDiscountDiscount
                          };

        axios
        .post('/api/discounts', clientParams)
        .then(function (response) {
          router.push('/discounts/' + response.data.id);
        }) 
        .catch(
          function(error) {
          // this.errors = error.response.data.errors;
        }.bind(this)
        );
    }

},
  computed: {},
};

var LocationNewPage = {
  template: "#locations-new-page",
  data: function() {
    return {
     newLocationAddress: "",
      newLocationCity: "",
      newLocationState: "",
      newLocationZip: ""
  };
},
created: function() {},
  methods: {
    addLocations: function() {
        var clientParams = {
                          address: this.newLocationAddress,
                          city: this.newLocationCity,
                          state: this.newLocationState,
                          zip: this.newLocationZip,
                          };

        axios
        .post('/api/locations', clientParams)
        .then(function(response) {
          this.locations.push(response.data);
          this.newLocationAddress = "";
          this.newLocationCity = "";
          this.newLocationState = "";
          this.newLocationZip= "";
          this.errors = [];
          // this.$route.router.go('/locations/new')
        }.bind(this))
        .catch(function(error) {
          this.errors = error.response.data.errors;
        }.bind(this));
  }
},
  computed: {},
};

var DiscountsShowPage = {
              template: "#discounts-show-page",
              data: function() {
                return {
                      discount: {
                                  id: 0,
                                  name: "",
                                  description: "",
                                  brand: "",
                                  discounted_price: "",
                                  date_available: "",
                                  locations: [
                                              
                                              ]
                                },
                      newLocationAddress: "",
                      newLocationCity: "",
                      newLocationState: "",
                      newLocationZip: "" 
              };
              },
              created: function() {
                axios
                .get("/api/discounts/" + this.$route.params.id )
                .then(function(response) {
                  this.discount = response.data;
                }.bind(this));
              },
              methods: {
                 addLocations: function() {
                     var clientParams = {
                                       address: this.newLocationAddress,
                                       city: this.newLocationCity,
                                       state: this.newLocationState,
                                       zip: this.newLocationZip,
                                       discount_id: this.discount.id
                                       };

                     axios
                     .post('/api/locations', clientParams)
                     .then(function(response) {
                       this.discount.locations.push(response.data);

                       this.newLocationAddress = "";
                       this.newLocationCity = "";
                       this.newLocationState = "";
                       this.newLocationZip= "";

                       this.errors = [];
                       router.push('/');
                     }.bind(this))
                     .catch(function(error) {
                       this.errors = error.response.data.errors;
                     }.bind(this));
               }
              },
                computed: {},
              };


var router = new VueRouter({
  routes: [{ path: "/", component: HomePage },
          { path: "/discounts/new", component: DiscountNewPage },
          { path: "/discounts/:id", component: DiscountsShowPage},
          { path: "/locations/new", component: LocationNewPage} 
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
