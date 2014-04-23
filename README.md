jqStars
=================

This is a small jQuery plugin to be used for ratings assignation and display on products, software, users in any website with some backend of some sort and uses the data attribute to retrieve the rating given or to display it.

## How it works

The relative HTML and Less/CSS is pretty straight forward, you can manipulate it easily, just look at the index.html, it should be easy enough for any one to customize the appearance with almost no effort.

### HTML

``` html
<div class="content">

  <h2>View</h2>
  <div class="stars" data-stars="80">
    <div class="color"></div>
    <div class="mask"></div>
  </div>

  <h2>Assign</h2>
  <div class="stars" data-assign-stars>
    <div class="color"></div>
    <div class="mask"></div>
  </div>

</div>
```

###Less

```less
.stars {
  position: relative;
  width: 150px;
  height: 28px;
  margin-left: 20px;
  margin-top: 20px;
  overflow: hidden;

  .color {
    height: inherit;
    width: inherit;
    position: absolute;
    top: 0;
    left: -100%;
    background: blue;

    -webkit-transition: all 1s;
       -moz-transition: all 1s;
        -ms-transition: all 1s;
         -o-transition: all 1s;
            transition: all 1s;

  }

  .mask {
    height: inherit;
    width: inherit;
    position: absolute;
    top: 0;
    right: 0;
    background: url(../images/star-mask.png) no-repeat center center;
    background-size: cover;
  }
}
```

<br>
<br>

---

<br>

## Options

### jqStars plugin options

```coffee
$(".stars").jqStars
  round: 20 # rounded values base 20 (20/40/60/80/100)
  callback: () ->
    console.log "Finished" # a callback function
  callbefore: () ->
    console.log "Before the plugin is started" # a function to start before the main plugin function is callled
return
```

### Data Attributes

By default the plugin start as a display rating one, which basically means that is used to display a value that needs to be inside the **data attribute** `data-stars` in the following way:

```html
<div class="stars" data-stars="80">
  <div class="color"></div>
  <div class="mask"></div>
</div>
```

The value needs to be recovered by you from a DB with any backend you have supporting your web application, like say PHP or .NET.

### `data-assign-stars`

```html
<div class="stars" data-assign-stars>
  <div class="color"></div>
  <div class="mask"></div>
</div>
```

Using the `data-assign-stars` transform the plugin from a rating visualization to a rating assignation one, and stores the user assigned value into a `data-stars-recived` data attribute that is ready to be recovered with jQuery `.attr()` function and placed in your database with Ajax.

## LICENSE

The MIT License (MIT)

Copyright (c) 2014 Krime Farm

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
