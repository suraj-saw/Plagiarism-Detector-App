-- ================================================================
-- Plagiarism Detector – Sample Reference Texts
-- ----------------------------------------------------------------
-- Instructions:
--   1. Go to your Supabase project → SQL Editor
--   2. Paste this entire file and click "Run"
--   3. Your app will now detect plagiarism on common topics
-- ================================================================

INSERT INTO reference_texts (filename, content, source_url) VALUES

(
  'sample/artificial_intelligence.txt',
  'Artificial intelligence (AI) is intelligence demonstrated by machines, as opposed to the natural intelligence displayed by animals including humans. AI research has been defined as the field of study of intelligent agents, which refers to any system that perceives its environment and takes actions that maximize its chance of achieving its goals. The term artificial intelligence had previously been used to describe machines that mimic and display human cognitive skills associated with the human mind, such as learning and problem-solving. This definition has since been rejected by major AI researchers who now describe AI in terms of rationality and acting rationally, which does not limit how intelligence can be articulated. AI applications include advanced web search engines, recommendation systems, understanding human speech, self-driving cars, generative and creative tools, and competing at the highest level in strategic games. As machines become increasingly capable, tasks considered to require intelligence are often removed from the definition of AI, a phenomenon known as the AI effect.',
  'https://en.wikipedia.org/wiki/Artificial_intelligence'
),

(
  'sample/machine_learning.txt',
  'Machine learning is a branch of artificial intelligence and computer science which focuses on the use of data and algorithms to imitate the way that humans learn, gradually improving its accuracy. Machine learning is an important component of the growing field of data science. Through the use of statistical methods, algorithms are trained to make classifications or predictions, and to uncover key insights in data mining projects. These insights subsequently drive decision making within applications and businesses, ideally impacting key growth metrics. Machine learning algorithms are trained on large datasets, and they can identify patterns and make decisions with minimal human intervention. Common applications of machine learning include image recognition, speech recognition, natural language processing, and recommendation systems.',
  'https://www.ibm.com/topics/machine-learning'
),

(
  'sample/climate_change.txt',
  'Climate change refers to long-term shifts in temperatures and weather patterns. These shifts may be natural, such as through variations in the solar cycle. But since the 1800s, human activities have been the main driver of climate change, primarily due to burning of fossil fuels like coal, oil and gas. Burning fossil fuels generates greenhouse gas emissions that act like a blanket wrapped around the Earth, trapping the sun''s heat and raising temperatures. Examples of greenhouse gas emissions that are causing climate change include carbon dioxide and methane. These come from using gasoline for driving a car or coal for heating a building. Clearing land and forests can also release carbon dioxide. Landfills for garbage are a major source of methane emissions. Energy, industry, transport, buildings, agriculture and land use are among the main emitters.',
  'https://www.un.org/en/climatechange/what-is-climate-change'
),

(
  'sample/blockchain.txt',
  'Blockchain is a shared, immutable ledger that facilitates the process of recording transactions and tracking assets in a business network. An asset can be tangible such as a house, car, cash, land or intangible such as intellectual property, patents, copyrights, or branding. Virtually anything of value can be tracked and traded on a blockchain network, reducing risk and cutting costs for all involved. A blockchain collects information together in groups, known as blocks, that hold sets of information. Blocks have certain storage capacities and, when filled, are closed and linked to the previously filled block, forming a chain of data known as the blockchain. All new information that follows that freshly added block is compiled into a newly formed block that will then also be added to the chain once filled.',
  'https://www.ibm.com/topics/blockchain'
),

(
  'sample/internet_of_things.txt',
  'The Internet of Things (IoT) describes physical objects with sensors, processing ability, software and other technologies that connect and exchange data with other devices and systems over the Internet or other communications networks. The Internet of Things encompasses electronics, communication and computer science engineering. IoT has been considered a misnomer because devices do not need to be connected to the public internet, they only need to be connected to a network and be individually addressable. The field has evolved due to the convergence of multiple technologies, including ubiquitous computing, commodity sensors, increasingly powerful embedded systems, and machine learning. Traditional fields of embedded systems, wireless sensor networks, control systems, automation including home and building automation, independently and collectively enable the Internet of Things.',
  'https://en.wikipedia.org/wiki/Internet_of_things'
),

(
  'sample/cybersecurity.txt',
  'Cybersecurity is the practice of protecting systems, networks, and programs from digital attacks. These cyberattacks are usually aimed at accessing, changing, or destroying sensitive information, extorting money from users via ransomware, or interrupting normal business processes. Implementing effective cybersecurity measures is particularly challenging today because there are more devices than people, and attackers are becoming more innovative. A successful cybersecurity approach has multiple layers of protection spread across the computers, networks, programs, or data that one intends to keep safe. In an organization, a unified threat management gateway system can automate integrations across products and accelerate key security operations functions: detection, investigation, and remediation.',
  'https://www.cisco.com/c/en/us/products/security/what-is-cybersecurity.html'
),

(
  'sample/renewable_energy.txt',
  'Renewable energy is energy from sources that are naturally replenishing but flow-limited; renewable resources are virtually inexhaustible in duration but limited in the amount of energy that is available per unit of time. The major types of renewable energy sources are biomass energy, including wood and wood waste, municipal solid waste, landfill gas and biogas, ethanol, and biodiesel; hydropower; geothermal energy; wind energy; and solar energy. Renewable energy is increasingly important as the world faces the threat of global warming and other environmental challenges. The transition to renewable energy is also creating new jobs and economic opportunities. Solar panels and wind turbines are now the cheapest sources of electricity in history, making renewable energy more accessible than ever before.',
  'https://www.eia.gov/energyexplained/renewable-sources/'
),

(
  'sample/cloud_computing.txt',
  'Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user. Large clouds often have functions distributed over multiple locations, each location being a data center. Cloud computing relies on sharing of resources to achieve coherence and economies of scale. Cloud computing is a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources such as networks, servers, storage, applications, and services that can be rapidly provisioned and released with minimal management effort or service provider interaction. The three main cloud computing service models are Infrastructure as a Service (IaaS), Platform as a Service (PaaS), and Software as a Service (SaaS).',
  'https://en.wikipedia.org/wiki/Cloud_computing'
),

(
  'sample/data_science.txt',
  'Data science is an interdisciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from noisy, structured and unstructured data, and apply knowledge and actionable insights from data across a broad range of application domains. Data science is related to data mining, machine learning and big data. Data science is a concept to unify statistics, data analysis, informatics, and their related methods in order to understand and analyze actual phenomena with data. It uses techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, information science, and domain knowledge. Data scientists use machine learning algorithms, statistical analysis, and data visualization tools to extract meaningful patterns from large datasets.',
  'https://en.wikipedia.org/wiki/Data_science'
),

(
  'sample/5g_technology.txt',
  '5G is the fifth generation technology standard for broadband cellular networks, which cellular phone companies began deploying worldwide in 2019, and is the planned successor to the 4G networks which provide connectivity to most current cellphones. 5G networks are predicted to have more than 1.7 billion subscribers worldwide by 2025. Like its predecessors, 5G networks are cellular networks, in which the service area is divided into small geographical areas called cells. All 5G wireless devices in a cell are connected to the Internet and telephone network by radio waves through a local antenna in the cell. The main advantage of the new networks is that they will have greater bandwidth, giving higher download speeds, eventually up to 10 gigabits per second.',
  'https://en.wikipedia.org/wiki/5G'
),

(
  'sample/electric_vehicles.txt',
  'An electric vehicle (EV) is a vehicle that uses one or more electric motors for propulsion. It can be powered by a collector system, with electricity from extravehicular sources, or it can be powered autonomously by a battery, which is sometimes charged by solar panels, or by converting fuel to electricity using fuel cells or a generator. EVs first came into existence in the mid-19th century, when electricity was among the preferred methods for motor vehicle propulsion, providing a level of comfort and ease of operation that could not be achieved by the gasoline-powered cars of the time. The primary benefit of EVs is their contribution to improving air quality, as they produce no tailpipe emissions. The widespread adoption of electric vehicles is seen as a key strategy in reducing greenhouse gas emissions from the transportation sector.',
  'https://en.wikipedia.org/wiki/Electric_vehicle'
),

(
  'sample/social_media.txt',
  'Social media are interactive technologies that facilitate the creation and sharing of information, ideas, interests, and other forms of expression through virtual communities and networks. While challenges to the definition of social media arise due to the broad variety of stand-alone and built-in social media services currently available, there are some common features. Social media are defined as a group of Internet-based applications that build on the ideological and technological foundations of Web 2.0, and that allow the creation and exchange of user-generated content. Social media help the development of online social networks by connecting a user''s profile with those of other individuals or groups. The rise of social media has transformed how people communicate, share information, and engage with the world around them.',
  'https://en.wikipedia.org/wiki/Social_media'
);
