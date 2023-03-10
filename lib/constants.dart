import 'package:flutter/material.dart';

import 'data_model/account.dart';

List<Account> suggestions = [
  Account(
    title: "Joe Biden",
    label: "Politician",
    image: Image(image: AssetImage("test/test_data/joe_biden.jpg")),
    statementsfrom: [
      Statement(
          statement:
              "This afternoon, I stopped by the State Department to meet with staff and thank them for their service to our nation. With their help, the United States will again lead not just by the example of our power, but by the power of our example.",
          author: "Joe Biden",
          date: DateTime(2021, 2, 5, 10, 10, 0),
          isFactual: false,
          description: "This statement is considered debatable as there is no correlation between the State Department and the percieved power of the United States",
          sources: ["https://www.google.com"]),
      Statement(
          statement:
              "The American Rescue Plan is getting us back on track — but we need to go further. We need the American Jobs Plan.",
          author: "Joe Biden"),
      Statement(
          statement:
              "We can ban assault weapons and high-capacity magazines. We can close loopholes in our gun background check system.",
          author: "Joe Biden"),
      Statement(
          statement:
              "Tonight, I’ll be answering questions at my first town hall since taking office. Make sure to tune in to CNN at 9 PM ET / 8 PM CT to watch.",
          author: "Joe Biden"),
      Statement(
          statement:
              "My message to the American people is this: America is moving again. And your life is going to change for the better thanks to the Bipartisan Infrastructure Deal.",
          author: "Joe Biden"),
      Statement(
          statement:
              "Seventeen Nobel Prize winning economists said that Build Back Better will ease longer-term inflationary pressures and lower costs for American families. We can get this done.",
          author: "Joe Biden"),
      Statement(
          statement:
              "Our economy has created 5.6 million jobs since January and unemployment is below 5%. But Americans across the country are facing prices that are just too high. We must pass the Build Back Better Act to lower costs for working families and help get people back to work.",
          author: "Joe Biden"),
      Statement(
          statement: "Unemployment is at a record low", author: "Joe Biden")
    ],
    statementsabout: [
      Statement(
          statement:
              "THE LIE-DEN ADMINISTRATION: President Biden, VP Harris and their administration are still pushing the lie that Build Back Better 'won’t cost anything'. How can a \$1.75 trillion plan be free?",
          author: "Sean Hannity",
          isFactual: true,
          description:
              "This statement is considered factual as the Infrastructure Bill will cost the American taxpayers in the longrun, while the benefits are still to be seen",
          date: DateTime(2021, 11, 13, 2, 30)),
      Statement(
          statement:
              "President Biden signs order to address 'crisis of violence' against Native Americans at White House summit"),
      Statement(
          statement:
              "President Biden to hold virtual summit with Chinese President Xi Jinping on Monday"),
      Statement(
          statement:
              "Today @POTUS signed the Bipartisan Infrastructure Deal into law— delivering critical investments in creating good union jobs, expanding broadband, and transforming our roads and bridges. Now let's pass #BuildBackBetterAct to invest in families and fix our broken tax system."),
      Statement(
          statement:
              "Biden made many progressive promises while campaigning @JoeBiden said at least \$15 hr & end tipped min wage & sub-min wage for people w/ disabilities & strong benefits & passing PRO Act, make it easier for workers to organize unions and collectively bargain."),
      Statement(
          statement:
              "In less than 3 months, millions of borrowers will be forced to resume payments on their student loan debt. @POTUS should use his existing legal authority to #CancelStudentDebt. This will help borrowers, jumpstart our economy & begin to narrow the racial wealth gap. Let's do this."),
      Statement(
          statement:
              "U.S. President Joe #Biden has signed the largest investment package since the 1950s. The one trillion package is designed to get America's infrastructure up and running"),
      Statement(
          statement:
              "BIDEN VS HARRIS? Rumors of tension in the Biden admin are swirling following several reports about VP Harris’ dysfunctional office. The rumors come as President Biden and VP Harris face terrible poll numbers and several crises.")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "Today, @POTUS will sign the Infrastructure Investment and Jobs Act into law. It is, indeed, an historic day.",
          author: "Kamala Harris",
          isFactual: false,
          description:
              "The signing of an Infrastructure Day cannot be labeled as historic as there have been infrastructure bills in the past.",
          date: DateTime(2021, 11, 15, 21, 9)),
      Statement(
          statement:
              "President Biden just signed the Bipartisan Infrastructure Deal into law. This is a once-in-a-generation investment in clean water, high-speed internet, public transit, roads, bridges, and more."),
      Statement(
          statement:
              "New: Initial unemployment insurance claims have declined for the fourth consecutive week and are down by nearly two-thirds from when President Biden took office. President Biden’s economic plans are working."),
      Statement(
          statement:
              "You can’t honestly believe @potus cares about the planet when he’s apart of a generation (boomers) that’s actively trying to destroy it."),
      Statement(
          statement:
              "U.S. President Joe #Biden has signed the largest investment package since the 1950s. The one trillion package is designed to get America's infrastructure up and running"),
      Statement(
          statement:
              "Xi tells Biden, 'We need to stabilize the rudder so that the two giant ships, China and the U.S., move forward against the wind and waves without veering off course, faltering, or colliding.'"),
      Statement(
          statement:
              "President Joe Biden to meet with Canadian Prime Minister Justin Trudeau and Mexican President Andrés Manuel López Obrador at the White House for the first North American Leaders' Summit since 2016")
    ],
  ),
  Account(
    title: "Palantir",
    label: "Company",
    image: Image(
      image: NetworkImage(
          "https://assets.wallstreet-online.de/_media/17340/unternehmen/size_645/palantir-logo.jpg"),
    ),
    statementsfrom: [
      Statement(
          statement:
              "This Veteran’s Day, we are grateful for our Pal-Vet community and those who support #Veterans"),
      Statement(
          statement:
              "'The speed, scope and scale of [COVID-19] data overwhelmed the government's outdated infrastructure... The next pandemic is coming. And it will require a new comprehensive national data infrastructure.' #Palantir's @KasslerMD"),
      Statement(
          statement:
              "Writing #data pipelines, like building real infrastructure, is slow, messy and expensive — requiring constant maintenance. #Palantir's Software-Defined Data Integration automates this pain away by generating complete pipelines out-of-the-box"),
      Statement(
          statement:
              "Since 2014, Palantir has offered gender-neutral parental leave. We currently provide up to 20 weeks for all employees, regardless of gender or role."),
      Statement(
          statement:
              "'The big ideas aren’t always on the roadmap. The big ideas come out of inspiration and perspiration. And the very best ideas, they start as heresy.' - #Palantir COO"),
      Statement(
          statement:
              "One year ago today — #Palantir is proud to recognize our first anniversary of listing on the @NYSE.")
    ],
    statementsabout: [
      Statement(
          statement:
              "Palantir is working with DoD to build AI that can analyze video feeds from aerial drones."),
      Statement(
          statement:
              "It is not always clear who is taking more interest in who. Palantir has shown it has reach and influence over the shaping of knowledge around data and privacy in Europe. Some of the continent’s leading thinkers on big data, artificial intelligence and ethics have worked with the company in a paid capacity."),
      Statement(
          statement: "Palantir establishes operations in Altendorf (SZ)."),
      Statement(
          statement:
              "'There’s something that doesn’t add up here between the circumventing of procurement practices, meetings at the highest level of government,' said In ‘t Veld, 'there’s a lot more beneath the surface than a simple software company.'")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "Palantir built Apollo nearly 10 years ago to deliver our platforms to some of the most remote, regulated environments, keeping systems operational 24/7. Now, we're bringing Apollo to customers to support the same deployment challenges."),
      Statement(
          statement:
              "When health concerns are driving business, the software product Palantir sells is Foundry; when terrorism fears are opening up budgets, it is Gotham."),
      Statement(
          statement:
              "It is not always clear who is taking more interest in who. Palantir has shown it has reach and influence over the shaping of knowledge around data and privacy in Europe. Some of the continent’s leading thinkers on big data, artificial intelligence and ethics have worked with the company in a paid capacity.")
    ],
  ),
  Account(
    title: "Amazon",
    label: "Company",
    image: Image(
        image: NetworkImage(
            "https://s3-symbol-logo.tradingview.com/amazon--600.png")),
    statementsfrom: [
      Statement(
          statement:
              "This is extraordinary and revealing. One of the most powerful politicians in the United States just said she’s going to break up an American company so that they can’t criticize her anymore."),
      Statement(
          statement:
              "In 2020, we stopped 200+ million suspected fake reviews before they were ever seen by a customer, and more than 99% of reviews enforcement was driven by our proactive detection."),
      Statement(
          statement:
              "This #VeteransDay, we celebrate those who have served and protected our country, including the 45,000+ U.S. veterans and military spouses who work at Amazon."),
      Statement(
          statement:
              "We want those selling in our store to grow and succeed. That’s why we - and third-party lenders - have loaned over \$800 million to small businesses so far this year."),
      Statement(
          statement:
              "@awscloud  is committed to helping to address funding gaps for underrepresented entrepreneurs."),
      Statement(
          statement:
              "Last year, we invested \$18+ billion in logistics, services, and tools for our small and medium-sized business partners, and there's 24,000+ employees dedicated to seller success in our store.")
    ],
    statementsabout: [
      Statement(
          statement:
              "I didn’t write the loopholes you exploit, @amazon – your armies of lawyers and lobbyists did. But you bet I’ll fight to make you pay your fair share. And fight your union-busting. And fight to break up Big Tech so you’re not powerful enough to heckle senators with snotty tweets."),
      Statement(
          statement:
              "Enjoyed speaking with @theMBL and @amazon about the Amazon Black Business Accelerator program earlier this month."),
      Statement(
          statement:
              "Alexa and 'Ziggy': Amazon gives its voice assistant a male voice")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "This is huge news! No doubt another indicator that Amazon is considering #cryptocurrencies as a way of reducing their transaction costs."),
      Statement(statement: "Amazon sprrays its boxes with pesticides"),
      Statement(
          statement:
              "the Post Office is losing billions of dollars … because it delivers packages for Amazon at a very below cost.")
    ],
  ),
  Account(
    title: "Goldman Sachs",
    label: "Company",
    image:
        Image(image: NetworkImage("https://design.gs.com/logo-circular.png")),
    statementsfrom: [
      Statement(statement: "Goldman Sachs is doing God's work"),
      Statement(
          statement:
              "Increased investment in innovative solutions will be needed to help the world reach sustainable climate goals."),
      Statement(
          statement:
              "We are pleased to congratulate our newly promoted class of 643 managing directors"),
      Statement(
          statement:
              "\$GS announces 3Q 2021 revenues and earnings per share. View the full results, accompanying presentation and learn more on our 10:30AM ET conference call"),
      Statement(statement: "Goldman Sachs is the best place to work. #worklife")
    ],
    statementsabout: [
      Statement(statement: "Goldman Sachs is Evil"),
      Statement(
          statement:
              "FDR said 'Judge me by the enemies I have made.' We agree, and we are proud to say that @LloydBlankfein, the former CEO of Goldman Sachs, is not supporting our campaign."),
      Statement(
          statement:
              "Everyone thinks Goldman is so fucking smart, just because Goldman says this is the right valuation, you shouldn’t assume it’s correct just because Goldman said it. My brother works at Goldman, and he’s an idiot!"),
      Statement(statement: "Goldman announced it now allows Sundays off.")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "At any rate, the US investment bank Goldman Sachs senses an opportunity. In the past few days, the bank has stocked up on high-yield bonds issued by Chinese real estate developers. A 'modest risk' has been taken, the bank said."),
      Statement(
          statement:
              "Goldman Sachs executives are wrestling with the question of whether they need to bump up salaries for junior investment bankers this year to match rivals on Wall Street after younger staff complained they were burnt out."),
    ],
  ),
  Account(
    title: "Citadel",
    label: "Company",
    image: Image(
        image: NetworkImage(
            "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1467923235/zusbl4no2snuczumz63a.png")),
    statementsfrom: [
      Statement(
          statement:
              "Citadel Securities did not ask Robinhood or any other firm to restrict or limit its trading activity on January 27th."),
      Statement(
          statement:
              "During this volatile period, Citadel Securities was the ONLY major market maker that executed buy and sell orders for individual investors without limitations."),
      Statement(
          statement:
              "There are those who still refuse to believe an American landed on the moon. Internet conspiracies and Twitter mobs try to ignore the facts, but the fact is that Citadel Securities was the pre-eminent market maker to the retail brokerage community in January 2021."),
      Statement(
          statement:
              "On January 27th, Citadel Securities executed an extraordinary 7.4 billion shares on behalf of retail investors."),
      Statement(
          statement: "Ken Griffin and Vlad Tenev have NEVER met or spoken")
    ],
    statementsabout: [
      Statement(
          statement:
              "When big sharks like Citadel and Robinhood come out ahead no matter what happens, and when the information they gather isn't disclosed, and when it's secret how that information is used, it's easier for these giants to skim off the top at the expense of small investors"),
      Statement(
          statement:
              "Ken Griffin of Citadel is a perfect example of how the financial industry uses its economic power to buy political power."),
      Statement(
          statement:
              "The Securities and Exchange Commission today announced that Citadel Securities LLC has agreed to pay \$22.6 million to settle charges that its business unit handling retail customer orders from other brokerage firms made misleading statements to them about the way it priced trades..")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "Plaintiffs suing Citadel Securities and others over trading restrictions on 'meme stocks' have filed a motion to strike the market maker’s recent court filing that leaned on the SEC’s report to dismiss the conspiracy charges.."),
      Statement(
          statement:
              "U.S. Securities and Exchange Commission Chair Gary Gensler is on a collision course with Citadel as his plans for overhauling stock trading rules take shape.")
    ],
  ),
  Account(
    title: "Shell",
    label: "Company",
    image: Image(
        image: NetworkImage(
            "https://brazilenergyinsight.com/wp-content/uploads/2019/03/shell.jpg")),
    statementsfrom: [
      Statement(
          statement:
              "Today the Board announced a proposal to simplify our share structure. The simplification would make Shell more competitive, allow for an acceleration in shareholder distributions and speed up our transition to a net-zero emissions energy business.."),
      Statement(statement: "Shell has never ever produced C02"),
      Statement(
          statement:
              "Shell has been investing in biofuels for a long time. Through our joint-venture @raizenoficial in Brazil, we are one of the world's largest sugar-cane ethanol producers."),
      Statement(
          statement:
              "'Shell has made a strong start to 2021, generating over \$800 billion of cash this quarter. Our competitive and robust financial performance provides the platform to achieve the goals of our Powering Progress strategy' Shell CEO Ben van Beurden."),
      Statement(
          statement:
              "Shell has started trading power from Europe’s largest battery storage project in the UK.")
    ],
    statementsabout: [
      Statement(
          statement:
              "Shell and BP paid zero tax on North Sea gas and oil for three years-'It’s outrageous that as the UK prepares to host global climate talks in Glasgow, we still have one of the lowest effective tax rates in the world for oil extraction"),
      Statement(
          statement:
              "The District Court in The Hague ruled that Shell must reduce its carbon emissions even faster than planned."),
      Statement(
          statement:
              "Major eco-criminal #RoyalDutchShell moving its HQ to London will be seen as a score for Brexit. Of course, because the move is motivated by UK’s Brexit deregulation opportunities after Dutch courts ruled Shell’s liability for eco crimes in Nigeria.")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "Shell will no longer meet the Dutch conditions to qualify for its 'royal' designation for the first time in more than 130 years, a change that will be put to a shareholder vote next month alongside broader plans to simplify its ownership structure."),
      Statement(
          statement:
              "Oil giant Royal Dutch Shell sank to a net loss of \$21.7bn (£16bn) last year after the coronavirus pandemic caused de-mand to slump. The announcement comes after two of its rivals, BP and Exxon, posted similar big losses."),
      Statement(
          statement:
              "#RoyalDutchShell has said it would scrap its dual share structure and move its head office to #Britain from the #Nether-lands, pushed away by Dutch taxes and facing climate pressure in court as the energy giant shifts from oil and gas.")
    ],
  ),
  Account(
    title: "CNN",
    label: "News Source",
    image: Image(
      image: NetworkImage(
          "https://www.logodesignlove.com/wp-content/uploads/2010/06/cnn-logo-white-on-red.jpg"),
      fit: BoxFit.cover,
    ),
    statementsfrom: [
      Statement(
          statement:
              "The US drug epidemic is the deadliest it has ever been, new federal data shows, with overdose deaths topping 100,000 annually for the first time",
          author: "CNN",
          date: DateTime(2021, 11, 17, 17, 27),
          isFactual: true,
          description: "Data shows that the deaths related to overdose have never been higher than April 2021 when they crossed the 100,000 mark",
          sources: [
            "https://www.cdc.gov/nchs/nvss/vsrr/drug-overdose-data.htm"
          ]),
      Statement(
          statement:
              "Pfizer seeks FDA emergency use authorization for its antiviral pill, which the company says reduces the risk of Covid-19 hospitalization and death."),
      Statement(
          statement:
              "The International Olympic Committee has announced new framework on transgender athletes, saying that no athlete should be excluded from competition on the assumption of an advantage due to their gender."),
      Statement(
          statement:
              "Evergrande chairman Xu Jiayin has sold more than 7 billion yuan (\$1.1 billion) worth of personal assets to prop up his embattled company, Chinese state media reported this week."),
      Statement(
          statement:
              "The Department of Homeland Security has stopped the practice of releasing migrants in the United States only with paperwork that tells them to report to an Immigration and Customs Enforcement office, Secretary Alejandro Mayorkas told senators"),
      Statement(
          statement:
              "New York City will once again welcome thousands of people to Times Square for the famed New Year's Eve ball drop tradition, so long as they show proof of vaccination against Covid-19."),
      Statement(
          statement:
              "More than six decades after the Soviets launched the first satellite, Sputnik 1, the junkyard in our skies is growing. Experts warn that much like the climate crisis facing Earth, space is also feeling the impact of human activity."),
      Statement(
          statement:
              "Counter-terrorism police are investigating after one person died and another was injured Sunday when a car exploded outside Liverpool Women's Hospital in northwest England")
    ],
    statementsabout: [
      Statement(
          statement:
              "CNN published a headline calling In-N-Out the choice of 'white supremacists",
          author: "ReganBabe",
          date: DateTime(2021, 10, 27, 18, 27),
          isFactual: false,
          description: "The headline could not be found on the CNN website, and a spokesperson for the news outlet confirmed it was never published.",
          sources: ["https://www.cnn.com"]),
      Statement(
          statement:
              "A day went by, and a second day went by, and there was no violence. I heard there was going to be massive violence. They showed violence -- because about 20 people were violent in the front row, but there was nobody behind them. So CNN had the cameras very low, pointing to the sky...They said, 'Massive crowds have gathered. Massive crowds.' And I looked, I said, 'That's a strange angle. I've never seen that angle.' It was like -- you had a cameraman sitting on the floor pointing up. But every once in a while, you say, 'There's nobody behind the people in the front row. What's going on?' And it was a con. It was fake news as usual"),
      Statement(
          statement:
              "Fox News Crushes CNN Competition In 3Q Cable News Ratings"),
      Statement(statement: "CNN faked all of its Trump coverage.")
    ],
    statementsrelevant: [
      Statement(
          statement:
              "CNN is a multinational news-based pay television channel headquartered in Atlanta, United States"),
      Statement(
          statement:
              "CNN known for its dramatic live coverage of breaking news, some of which has drawn criticism as overly sensationalistic, has stressed its efforts to be nonpartisan, which have led to accusations of false balance."),
      Statement(
          statement:
              "Conspiracy theorists will say that CNN had packed the crowd for its old friend. But the audience imbalance, like the inclusion of Carville and Gergen, was more an indictment of CNN’s incompetence.",
          author: "Steve Kornacki",
          isFactual: true,
          description:
              "The 2007 Presidential debate is widely considered to have been filled with mainly pro-Clinton supporters",
          date: DateTime(2007, 11, 25, 10, 00)),
      Statement(
          statement:
              "CNN was the first television channel to provide 24-hour news coverage and was the first all-news television channel in the United States")
    ],
  ),
  Account(
      title: 'Apple',
      label: 'Company',
      image: Image(
        image: NetworkImage(
            "https://www.apple.com/ac/structured-data/images/open_graph_logo.png?202111120425"),
      )),
  Account(
      title: 'Apple',
      label: 'Fruit',
      image: Image(
          image: NetworkImage(
              "https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png"))),
  Account(
      title: 'Nicky Minaj',
      label: 'Singer',
      image: Image(
        image: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/5/54/Nicki_Minaj_MTV_VMAs_4.jpg"),
      )),
  Account(
      title: 'Benjamin Shapiro',
      label: 'Author',
      image: Image(
        image: NetworkImage(
            "https://2sai80zhft74386rl1kqxhyw-wpengine.netdna-ssl.com/wp-content/uploads/2021/08/Ben-Shapiro-Headshot-1.jpg"),
      )),
  Account(
      title: 'Jordan Peterson',
      label: 'Author',
      image: Image(
        image: NetworkImage(
            "https://www.timeshighereducation.com/sites/default/files/styles/the_breaking_news_image_style/public/the040419_p16_peterson.jpg?itok=13lrkbaF"),
      ))
];
