# **Localization**

We will create translation files as JSON files and name them according to different languages. For example, "th.json" will be the translation file for the Thai language, and "en.json" will be the translation file for the English language. Translation files should have the same structure to ensure accurate retrieval of language translations.

## **Translation file structure**

```
[page]: {

    [section]: {
        [key]: translation
    }

}

```

or

```

[page]: {

    [key]: translation

}
```

### **page**

This is the division between different pages

```
home: {
    ...
},
service: {
    ...
}

```

### **section**

This is the grouping of content within each page

```
home: {
    section1: {
        ...
    },
    section2: {
        ...
    }
},
```

### **key**

This represents the location where we will place the translations for different languages

```
home: {
    section1: {
        title: "Want to build an amazing digital product? We can help you make it happen"
    },
    section2: {
        title: "Trusted by Partners & Clients"
    }
},
```
