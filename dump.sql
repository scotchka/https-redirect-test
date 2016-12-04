--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE authors (
    author_id integer NOT NULL,
    goodreads_author_id integer,
    name character varying(200) NOT NULL,
    biography text
);


ALTER TABLE authors OWNER TO "Henry";

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_author_id_seq OWNER TO "Henry";

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE authors_author_id_seq OWNED BY authors.author_id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE awards (
    award_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    image_url character varying(300)
);


ALTER TABLE awards OWNER TO "Henry";

--
-- Name: awards_award_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE awards_award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE awards_award_id_seq OWNER TO "Henry";

--
-- Name: awards_award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE awards_award_id_seq OWNED BY awards.award_id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE books (
    book_id integer NOT NULL,
    title character varying(300) NOT NULL,
    description text,
    pages integer,
    published integer,
    language character varying(15),
    isbn10 character varying(15),
    isbn13 character varying(15),
    image_url character varying(300)
);


ALTER TABLE books OWNER TO "Henry";

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE books_authors (
    book_author_id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE books_authors OWNER TO "Henry";

--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE books_authors_book_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_authors_book_author_id_seq OWNER TO "Henry";

--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE books_authors_book_author_id_seq OWNED BY books_authors.book_author_id;


--
-- Name: books_awards; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE books_awards (
    book_award_id integer NOT NULL,
    book_id integer NOT NULL,
    award_id integer NOT NULL,
    year integer NOT NULL
);


ALTER TABLE books_awards OWNER TO "Henry";

--
-- Name: books_awards_book_award_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE books_awards_book_award_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_awards_book_award_id_seq OWNER TO "Henry";

--
-- Name: books_awards_book_award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE books_awards_book_award_id_seq OWNED BY books_awards.book_award_id;


--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_book_id_seq OWNER TO "Henry";

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE books_book_id_seq OWNED BY books.book_id;


--
-- Name: books_genres; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE books_genres (
    book_genre_id integer NOT NULL,
    book_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE books_genres OWNER TO "Henry";

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE books_genres_book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_genres_book_genre_id_seq OWNER TO "Henry";

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE books_genres_book_genre_id_seq OWNED BY books_genres.book_genre_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: Henry
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    genre character varying(30)
);


ALTER TABLE genres OWNER TO "Henry";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: Henry
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO "Henry";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Henry
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: author_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY authors ALTER COLUMN author_id SET DEFAULT nextval('authors_author_id_seq'::regclass);


--
-- Name: award_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY awards ALTER COLUMN award_id SET DEFAULT nextval('awards_award_id_seq'::regclass);


--
-- Name: book_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq'::regclass);


--
-- Name: book_author_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_authors ALTER COLUMN book_author_id SET DEFAULT nextval('books_authors_book_author_id_seq'::regclass);


--
-- Name: book_award_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_awards ALTER COLUMN book_award_id SET DEFAULT nextval('books_awards_book_award_id_seq'::regclass);


--
-- Name: book_genre_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_genres ALTER COLUMN book_genre_id SET DEFAULT nextval('books_genres_book_genre_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY authors (author_id, goodreads_author_id, name, biography) FROM stdin;
1	\N	Ian McEwan	\N
2	\N	Matthew Kneale	\N
3	\N	Julian Barnes	\N
4	\N	Rohinton Mistry	\N
5	\N	J. M. Coetzee	\N
6	\N	Beryl Bainbridge	\N
7	\N	Peter Carey	\N
8	\N	Kazuo Ishiguro	\N
9	\N	Margaret Atwood	\N
10	\N	John McGahern	\N
11	\N	George Mackay Brown	\N
12	\N	Patrick McCabe	\N
13	\N	Caryl Phillips	\N
14	\N	Michèle Roberts	\N
15	\N	Tim Parks	\N
16	\N	Anita Desai	\N
17	\N	Bernard MacLaverty	\N
18	\N	Michael Frayn	\N
19	\N	Ali Smith	\N
20	\N	James Kelman	\N
21	\N	Justin Cartwright	\N
22	\N	Jill Paton Walsh	\N
23	\N	Graham Swift	\N
24	\N	Brian Moore	\N
25	\N	Barry Unsworth	\N
26	\N	David Mitchell	\N
27	\N	Andrew O’Hagan	\N
28	\N	Andrew Miller	\N
29	\N	Roddy Doyle	\N
30	\N	Abdulrazak Gurnah	\N
31	\N	A. S. Byatt	\N
32	\N	Jim Crace	\N
33	\N	Seamus Deane	\N
34	\N	William Trevor	\N
35	\N	Romesh Gunesekera	\N
36	\N	David Malouf	\N
37	\N	Michael Ignatieff	\N
38	\N	Christopher Hope	\N
39	\N	Mordecai Richler	\N
40	\N	Colm Toibin	\N
41	\N	Rachel Seiffert	\N
42	\N	Brian O’Doherty	\N
43	\N	Michael Ondaatje	\N
44	\N	Madeleine St John	\N
45	\N	Ben Okri	\N
46	\N	Alan Hollinghurst	\N
47	\N	Penelope Fitzgerald	\N
48	\N	Pat Barker	\N
49	\N	Arundhati Roy	\N
50	\N	Trezza Azzopardi	\N
51	\N	Martin Booth	\N
52	\N	Michael Collins	\N
53	\N	Ahdaf Soueif	\N
54	\N	Salman Rushdie	\N
55	\N	Shena Mackay	\N
56	\N	Timothy Mo	\N
57	\N	Magnus Mills	\N
58	\N	Tim Winton	\N
59	\N	Carol Shields	\N
60	\N	Mick Jackson	\N
61	\N	Martin Amis	\N
62	\N	Tibor Fischer	\N
63	\N	Samuel Brittan	\N
64	\N	James Stourton	\N
65	\N	Bruce Altshuler	\N
66	\N	Stella Tillyard	\N
67	\N	Ron Chernow	\N
68	\N	Hugh Brogan	\N
69	\N	Linda Lear	\N
70	\N	Andrew Wilson.	\N
71	\N	Jackie Wullschlager	\N
72	\N	Hermione Lee	\N
73	\N	Conrad Black	\N
74	\N	Hugh Barnes	\N
75	\N	Rosemary Hill	\N
76	\N	Lou Cannon	\N
77	\N	Robert Hughes	\N
78	\N	Eric Hobsbawn	\N
79	\N	Jung Chang	\N
80	\N	Jon Halliday	\N
81	\N	Peter France	\N
82	\N	William St Clair	\N
83	\N	Robert A. Caro	\N
84	\N	Hilary Spurling	\N
85	\N	David Cannadine	\N
86	\N	Rick Perlstein	\N
87	\N	David Bodanis	\N
88	\N	T.J. Binyon	\N
89	\N	Jonathan Bate	\N
90	\N	Tim Jeal	\N
91	\N	David Watkin	\N
92	\N	Maggie Fergusson	\N
93	\N	Sandra Day O'Connor	\N
94	\N	Fred Siegel.	\N
95	\N	Roger Knight.	\N
96	\N	Laird M. Easton	\N
97	\N	Jonathan Carr	\N
98	\N	Claire Tomalin	\N
99	\N	Janet Malcolm	\N
100	\N	Josiah Bunting	\N
101	\N	R.F. Foster	\N
102	\N	Brenda Wineapple	\N
103	\N	Robert McCrum	\N
104	\N	Jane Ridley	\N
105	\N	Ezra Vogel	\N
106	\N	D.T. Max	\N
107	\N	Paul Hendrickson	\N
108	\N	Lyndall Gordon	\N
109	\N	Victoria Glendinning	\N
110	\N	Susan Orlean	\N
111	\N	Molly Peacock	\N
112	\N	Jenny Uglow	\N
113	\N	Noel Malcolm	\N
114	\N	Sheila Hale	\N
115	\N	Steven Naifeh	\N
116	\N	Gregory White Smith	\N
117	\N	Deborah Scroggins	\N
118	\N	Melvin Urofsky	\N
119	\N	Tristram Hunt	\N
120	\N	Terry Teachout	\N
121	\N	Frances Wilson	\N
122	\N	Edgar J. Dosman	\N
123	\N	Selina Hastings	\N
124	\N	John Carey	\N
125	\N	James Gavin	\N
126	\N	Nadine Cohodas	\N
127	\N	Gideon Haigh	\N
128	\N	Niall Ferguson	\N
129	\N	Charles D. Ellis	\N
130	\N	Christopher Byron	\N
131	\N	Charles Handy	\N
132	\N	Conor O'Clery	\N
133	\N	Adam Macqueen	\N
134	\N	William Taubman	\N
135	\N	Patrick French	\N
136	\N	James B. Stewart	\N
137	\N	Paul Midler	\N
138	\N	Steve Coll	\N
139	\N	Paul MacAvoy	\N
140	\N	Ira Millstein	\N
141	\N	John Battelle	\N
142	\N	Charles R. Morris	\N
143	\N	Charles Fishman.	\N
144	\N	William D. Cohan	\N
145	\N	Chris Zook	\N
146	\N	Leslie R. Crutchfield	\N
147	\N	Heather McLeod Grant	\N
148	\N	Hal Sirkin	\N
149	\N	Jim Hemerling	\N
150	\N	Arindam Bhattacharya	\N
151	\N	Terry Leahy	\N
152	\N	William C. Taylor	\N
153	\N	Polly LaBarre	\N
154	\N	Ian Ayres	\N
155	\N	Nassim Nicholas Taleb	\N
156	\N	John Roberts	\N
157	\N	Peter Marsh	\N
158	\N	Joan Magretta	\N
159	\N	Nan Stone	\N
160	\N	Don Tapscott	\N
161	\N	Anthondy D. Williams	\N
162	\N	Mark Kleiman	\N
163	\N	Richard Lloyd Parry	\N
164	\N	Jonathan Cape	\N
165	\N	Kurt Eichenwald	\N
166	\N	Iqbal Ahmed	\N
167	\N	Stephen Greenblatt	\N
168	\N	Nomi Prins	\N
169	\N	Paul Collier	\N
170	\N	C.K. Prahalad	\N
171	\N	Daron Acemoglu	\N
172	\N	James Robinson	\N
173	\N	Abhijit Banerjee	\N
174	\N	Esther Duflo	\N
175	\N	Yasheng Huang	\N
176	\N	Steven D. Levitt	\N
177	\N	Stephen J. Dubner	\N
178	\N	Bjorn Lomborg	\N
179	\N	John Cassidy	\N
180	\N	Amory Lovins	\N
181	\N	Tim Harford	\N
182	\N	William N. Goetzmann	\N
183	\N	K. Geert Rouwenhorst	\N
184	\N	Amar Bhide	\N
185	\N	Martin Wolf	\N
186	\N	Rakesh Khurana	\N
187	\N	Peter Wollen	\N
188	\N	James Wood	\N
189	\N	Elif Batuman	\N
190	\N	Marilynne Robinson	\N
191	\N	John Jeremiah Sullivan	\N
192	\N	Adam Gopnik	\N
193	\N	Haruki Murakami	\N
194	\N	J.K. Rowling	\N
195	\N	Sebastian Mallaby	\N
196	\N	Nicholas Lander	\N
197	\N	Maria McCann	\N
198	\N	W.G. Sebald	\N
199	\N	Dai Sijie	\N
200	\N	Hilary Mantel	\N
201	\N	James Shapiro	\N
202	\N	Joseph Horowitz	\N
203	\N	George Black	\N
204	\N	Maya Jasanoff	\N
205	\N	Iain Sinclair	\N
206	\N	Roderick Cavaliero	\N
207	\N	John Pemble	\N
208	\N	Martin Gayford	\N
209	\N	Elaine Showalter	\N
210	\N	Samuel Beckett	\N
211	\N	 Lois More Overbeck 	\N
212	\N	Martha Dow Fehsenfeld	\N
213	\N	Larry Stempel	\N
214	\N	Michael Scott Moore	\N
215	\N	Steven Pinker	\N
216	\N	Arturo Warman	\N
217	\N	Arthur Herman	\N
218	\N	Liaquat Ahamed	\N
219	\N	Tim Clissold	\N
220	\N	Michael Lewis	\N
221	\N	Andrew Ross Sorkin	\N
222	\N	Gretchen Morgenson	\N
223	\N	Joshua Rosner	\N
224	\N	Tyler Cowen	\N
225	\N	Steve Pincus	\N
226	\N	Tom Segev	\N
227	\N	Stacy Schiff	\N
228	\N	Neil MacGregor	\N
229	\N	Sarah Helm	\N
230	\N	William J. Bernstein	\N
231	\N	Juliet Barker	\N
232	\N	Stephen Kinzer	\N
233	\N	Alexander Rose	\N
234	\N	Frederick Kempe	\N
235	\N	Leonard Blusse	\N
236	\N	Andrew Meier	\N
237	\N	Timothy Snyder	\N
238	\N	Judith Herrin	\N
239	\N	Robert K. Massie	\N
240	\N	James M. McPherson	\N
241	\N	Roger Crowley	\N
242	\N	Anthony Lewis	\N
243	\N	Walter Russell Mead	\N
244	\N	Adam Nicolson	\N
245	\N	Caroline Elkins	\N
246	\N	Nicholas Shakespeare	\N
247	\N	Simon Sebag Montefiore	\N
248	\N	Aleksandr Fursenko	\N
249	\N	Timothy Naftali	\N
250	\N	Tim Weiner	\N
251	\N	Frank Dikotter	\N
252	\N	Andrew Roberts	\N
253	\N	Suketu Mehta	\N
254	\N	Norman Davies	\N
255	\N	Roger Moorehouse	\N
256	\N	Jonathan Fenby	\N
257	\N	Charles Esdaile	\N
258	\N	Philip P. Pan	\N
259	\N	Francis Spufford	\N
260	\N	Diarmaid MacCulloch	\N
261	\N	Simon Schama	\N
262	\N	Dominic Lieven	\N
263	\N	Rosemary Goring	\N
264	\N	Matthew Restall	\N
265	\N	Hugh Pope	\N
266	\N	Hermann Giliomee	\N
267	\N	Richard Holmes	\N
268	\N	Javier Cercas	\N
269	\N	Eugene Rogan	\N
270	\N	Antony Beevor	\N
271	\N	David Cordingly	\N
272	\N	Sarah Wise	\N
273	\N	Robert C. Allen	\N
274	\N	Allan M. Brandt	\N
275	\N	N.A.M. Rodger	\N
276	\N	Halik Kochanski	\N
277	\N	Philip Snow	\N
278	\N	David Abulafia	\N
279	\N	Martin Windrow	\N
280	\N	Ben Wilson	\N
281	\N	John Adamson	\N
282	\N	David Gilmour	\N
283	\N	Robert Kagan	\N
284	\N	Sean Wilentz	\N
285	\N	Matthew Parker	\N
286	\N	Jane Robins	\N
287	\N	Adrian Tinniswood	\N
288	\N	A.N.Wilson	\N
289	\N	Adam Tooze	\N
290	\N	Isabel Wilkerson	\N
291	\N	Mark Thompson	\N
292	\N	David Maraniss	\N
293	\N	Yang Jisheng	\N
294	\N	Victor Sebestyen	\N
295	\N	John Darwin	\N
296	\N	Margaret Plant	\N
297	\N	Ian Morris	\N
298	\N	John Keegan	\N
299	\N	Anne Applebaum	\N
300	\N	Adam Hochschild	\N
301	\N	Mohamed El-Erian	\N
302	\N	Lynne Truss	\N
303	\N	Henry Hitchings	\N
304	\N	David Crystal	\N
305	\N	Guy Deutscher	\N
306	\N	David Bellos	\N
307	\N	Adam B. Jaffe	\N
308	\N	Josh Lerner	\N
309	\N	Bill George	\N
310	\N	Joan Didion	\N
311	\N	Stephen Sondheim	\N
312	\N	Janine di Giovanni	\N
313	\N	Alan Root	\N
314	\N	Eric Siblin	\N
315	\N	Edmund de Waal	\N
316	\N	Chris Williams	\N
317	\N	Richard Burton	\N
318	\N	Gabriel Weston	\N
319	\N	Samuel Fuller	\N
320	\N	William Fiennes	\N
321	\N	Ferdinand Mount	\N
322	\N	Dominic Dromgoole	\N
323	\N	Rick Gekoski	\N
324	\N	Alan Greenspan	\N
325	\N	Horatio Clare	\N
326	\N	Amos Oz	\N
327	\N	Andrew Brown	\N
328	\N	Raja Shehadeh.	\N
329	\N	Marjane Satrapi	\N
330	\N	Sandy Balfour	\N
331	\N	Hooman Majd	\N
332	\N	Ted Gioia	\N
333	\N	Bernard Williams	\N
334	\N	Richard Taruskin	\N
335	\N	Tom Service	\N
336	\N	Simon Barnes	\N
337	\N	Robert Macfarlane	\N
338	\N	Gavin Pretor-Pinney	\N
339	\N	Wade Davis	\N
340	\N	Jean Sprackland	\N
341	\N	Matthew De Abaitua	\N
342	\N	A.S. Byatt	\N
343	\N	Philipp Meyer	\N
344	\N	Mark Costello	\N
345	\N	Alexis Wright	\N
346	\N	Mary Lawson	\N
347	\N	Jonathan Safran Foer	\N
348	\N	Jonathan Franzen	\N
349	\N	Kerry Hardie	\N
350	\N	Gerard Woodward	\N
351	\N	Pat Keough	\N
352	\N	Rosemarie Keough	\N
353	\N	Jim Dine	\N
354	\N	Seamus Heaney	\N
355	\N	George Packer	\N
356	\N	Tobias Jones	\N
357	\N	Jane Mayer	\N
358	\N	Jeffrey Toobin	\N
359	\N	Michael Pollan	\N
360	\N	Faramerz Dabhoiwala	\N
361	\N	Daniel Kahneman	\N
362	\N	Philippa Perry	\N
363	\N	Christopher Turner	\N
364	\N	Sonia Fleiro	\N
365	\N	Edward Glaeser	\N
366	\N	Lynn Sherr	\N
367	\N	Tyler Hamilton	\N
368	\N	Daniel Coyle	\N
369	\N	Anton Checkhov	\N
370	\N	Raymond Carver	\N
371	\N	Philip Marsden	\N
372	\N	Nigel McGilchrist	\N
373	\N	Ben Rawlence	\N
374	\N	Ben Schott	\N
375	\N	William Gibson	\N
376	\N	Antoine Audouard	\N
377	\N	Daniyal Mueenuddin	\N
378	\N	Geoff Dyer	\N
379	\N	Mario Vargas Llosa	\N
380	\N	Diane Johnson	\N
381	\N	Richard Price	\N
382	\N	Joanna Trollope	\N
383	\N	Lloyd Jones	\N
384	\N	Adam Ross	\N
385	\N	Orhan Pamuk	\N
386	\N	Teju Cole	\N
387	\N	Stephen Scourfield	\N
388	\N	Ma Jian	\N
389	\N	Amitav Ghosh	\N
390	\N	Dick Francis	\N
391	\N	Joseph O'Connor	\N
392	\N	Pascal Quignard	\N
393	\N	Guy Saville	\N
394	\N	Anne Tyler	\N
395	\N	Tim Gautreaux	\N
396	\N	Mark Haddon	\N
397	\N	Claire Messud	\N
398	\N	Tan Twang Eng	\N
399	\N	Robert Harris	\N
400	\N	Simon Mawer	\N
401	\N	Shirley Hazzard	\N
402	\N	James Lasdun	\N
403	\N	Philip Roth	\N
404	\N	Tom Rachman	\N
405	\N	Peter Ackroyd	\N
406	\N	E.L. Doctorow	\N
407	\N	Jeffrey Eugenides	\N
408	\N	Ursula K. Le Guin	\N
409	\N	Sophie Gee	\N
410	\N	Sebastian Barry	\N
411	\N	Dalia Sofer	\N
412	\N	Doris Lessing	\N
413	\N	Julia Blackburn.	\N
414	\N	Tea Obreht	\N
415	\N	Alan Bennett	\N
416	\N	Joshua Ferris	\N
417	\N	Anne Michaels	\N
418	\N	Michael Chabon	\N
419	\N	David Grossman	\N
420	\N	Alice Munro	\N
421	\N	Denis Johnson	\N
422	\N	Matthew Glass	\N
423	\N	Siri Hustvedt	\N
424	\N	Zadie Smith	\N
425	\N	Javier Marías	\N
426	\N	Marina Lewycka	\N
427	\N	Henry Porter	\N
428	\N	Chris Cleave	\N
429	\N	Irene Nemirovsky	\N
430	\N	Michael Cox	\N
431	\N	Mark Burnell	\N
432	\N	Ngugi wa Thiong'o	\N
433	\N	Philip Pullman	\N
434	\N	Jorie Graham	\N
435	\N	Herman Koch	\N
436	\N	Lawrence Osborne	\N
437	\N	Marie N’Diaye	\N
438	\N	James Fenton	\N
439	\N	Raimond Gaita	\N
440	\N	Arthur Schlesinger Jr.	\N
441	\N	Ion Trewin	\N
442	\N	James Atlas	\N
443	\N	Joseph O'Neill	\N
444	\N	Robert Putnam	\N
445	\N	William Leith	\N
446	\N	Annabel Jane Wharton	\N
447	\N	Michael E. Porter	\N
448	\N	Hirotaka Takeuchi, Mariko Sakakibara	\N
449	\N	Whitney Balliett	\N
450	\N	Maximilian E. Novak	\N
451	\N	Tom Courtenay	\N
452	\N	Larry Siedentop	\N
453	\N	Bernard Wasserstein	\N
454	\N	Emma Rothschild	\N
455	\N	Eamonn Mallie	\N
456	\N	David McKittrick	\N
457	\N	David Bret	\N
458	\N	Carlo Gebler	\N
459	\N	David Fraser	\N
460	\N	Ian Kershaw	\N
461	\N	James Lovelock	\N
462	\N	Jorge Cañizares-Esguerra	\N
463	\N	Michela Wrong	\N
464	\N	S. Guhan	\N
465	\N	Stephen Howe	\N
466	\N	Robert J. Shiller	\N
467	\N	Robert Skidelsky	\N
468	\N	Volker Braun	\N
469	\N	R.L.Trask	\N
470	\N	Suzanne Finstad	\N
471	\N	Witold Rybczynski	\N
472	\N	Frank Kermode	\N
473	\N	Edwin Becker	\N
474	\N	Roman Prahl	\N
475	\N	Petr Willich	\N
476	\N	Edward Fox	\N
477	\N	Laura Hillenbrand	\N
478	\N	David Hockney	\N
479	\N	Joachim Fest	\N
480	\N	George Gilder	\N
481	\N	Richard Overy	\N
482	\N	Marianne Elliott	\N
483	\N	David Kynaston	\N
484	\N	Susan Solomon	\N
485	\N	Doron Swade	\N
486	\N	Francis Haskell	\N
487	\N	Hew Strachan	\N
488	\N	Sara Gay Forden	\N
489	\N	Jonathan Rose	\N
490	\N	Richard Hamblyn	\N
491	\N	Zachary Leader	\N
492	\N	Todd Longstaffe-Gowan	\N
493	\N	Louis Menand	\N
494	\N	M.J. Cohen	\N
495	\N	Meg Greenfield	\N
496	\N	Katherine Boo	\N
497	\N	Amanda Foreman	\N
498	\N	Bob Dylan	\N
499	\N	Andrew Solomon	\N
500	\N	Adair Turner	\N
501	\N	Malachi Haim Hacohen	\N
502	\N	Mancur Olson	\N
503	\N	Lawrence Wright	\N
504	\N	Oliver Sacks	\N
505	\N	Rebecca Elson	\N
506	\N	Geoffrey Lehmann	\N
507	\N	Robert Gray	\N
508	\N	Dick Davis	\N
509	\N	Geoffrey Hill	\N
510	\N	Anne Carson	\N
511	\N	Alice Oswald	\N
512	\N	Paul Muldoon	\N
513	\N	Derek Walcott	\N
514	\N	Lawrence Freedman	\N
515	\N	Ivo H. Daalder	\N
516	\N	James M. Lindsay	\N
517	\N	Jason DeParle	\N
518	\N	Richard Rhodes	\N
519	\N	David Marquand	\N
520	\N	Sherard Cowper-Coles	\N
521	\N	Seymour M. Hersh	\N
522	\N	James Kynge	\N
523	\N	Peter Hessler	\N
524	\N	Basharat Peer	\N
525	\N	Jason Stearns	\N
526	\N	James Buchanan	\N
527	\N	Sam Kiley	\N
528	\N	Heidi Holland	\N
529	\N	Ian Goldin	\N
530	\N	Geoffrey Cameron	\N
531	\N	Meera Balarajan	\N
532	\N	Pankaj Mishra	\N
533	\N	John Heilemann	\N
534	\N	Mark Halperin	\N
535	\N	Roberto Saviano	\N
536	\N	Joseph Margulies	\N
537	\N	David Remnick	\N
538	\N	Anders Aslund	\N
539	\N	Edward Luce	\N
540	\N	Sally Neighbour	\N
541	\N	Ramachandra Guha	\N
542	\N	Arvind Panagariya	\N
543	\N	Gilles Kepel	\N
544	\N	Benjamin Wittes	\N
545	\N	Rachel Polonsky	\N
546	\N	Anthony Shadid	\N
547	\N	Anatol Lieven	\N
548	\N	Bob Woodward	\N
549	\N	Cass R. Sunstein	\N
550	\N	Adrian Nicole LeBlanc	\N
551	\N	Carl Walter	\N
552	\N	Fraser Howie	\N
553	\N	Clyde Prestowitz	\N
554	\N	Michael Burleigh	\N
555	\N	Margaret MacMillan	\N
556	\N	John Dunn	\N
557	\N	John Lewis Gaddis	\N
558	\N	Thomas Kean	\N
559	\N	National Commission on Terrorist Attacks Upon the United States	\N
560	\N	Jason Burke	\N
561	\N	David Kilcullen	\N
562	\N	Francisco Goldman	\N
563	\N	William Langewiesche	\N
564	\N	Franklin E. Zimring	\N
565	\N	Ali A. Allawi	\N
566	\N	Clive Stafford Smith	\N
567	\N	John B. Judis	\N
568	\N	 Ruy Teixeira	\N
569	\N	Noah Feldman	\N
570	\N	Peter Godwin	\N
571	\N	Amartya Sen	\N
572	\N	Vivek Wadhwa	\N
573	\N	Ian Bremmer	\N
574	\N	Michael Grunwald	\N
575	\N	Ron Suskind	\N
576	\N	Joseph S. Nye	\N
577	\N	Richard McGregor	\N
578	\N	David Willetts	\N
579	\N	Earl Black	\N
580	\N	Merle Black	\N
581	\N	Tom Bingham	\N
582	\N	Philip Bobbitt	\N
583	\N	Brian A. Nelson	\N
584	\N	Kenneth M. Pollack	\N
585	\N	Joseph E. Stiglitz	\N
586	\N	Linda J. Bilmes	\N
587	\N	Robert Calderisi	\N
588	\N	Shane Harris	\N
589	\N	Aidan Hartley	\N
590	\N	Judith Garfield Todd	\N
591	\N	Jianying Zha	\N
592	\N	William Easterly	\N
593	\N	Amy Chua	\N
594	\N	Richard Wrangham	\N
595	\N	Sean B. Carroll	\N
596	\N	Graham Farmelo	\N
597	\N	Mike Hulme	\N
598	\N	Paul Edwards	\N
599	\N	Francis Spufford.	\N
600	\N	Ben Goldacre	\N
601	\N	Rob Carlson	\N
602	\N	Jared Diamond	\N
603	\N	Peter T. Scardino	\N
604	\N	Judith Kelman	\N
605	\N	Richard Fortey	\N
606	\N	Dale Peterson	\N
607	\N	Peter Galison	\N
608	\N	Matthew Connelly	\N
609	\N	Sudhir Venkatesh	\N
610	\N	David Victor	\N
611	\N	Nate Silver	\N
612	\N	James Essinger	\N
613	\N	Matt Ridley	\N
614	\N	Richard H. Thaler	\N
615	\N	Callum Roberts	\N
616	\N	Michio Kaku	\N
617	\N	Nick Lane	\N
618	\N	George Dyson	\N
619	\N	Tim Lenton	\N
620	\N	Andrew Watson	\N
621	\N	David Quammen	\N
622	\N	David Deutsch	\N
623	\N	Rose George	\N
624	\N	Siddhartha Mukherjee	\N
625	\N	Charles Clover	\N
626	\N	Jim Shreeve	\N
627	\N	Alan Macfarlane	\N
628	\N	Gerry Martin	\N
629	\N	Richard Dawkins	\N
630	\N	Mark Lynas	\N
631	\N	James Gleick	\N
632	\N	Ken Alder.	\N
633	\N	Marcus du Sautoy	\N
634	\N	Timothy Gowers	\N
635	\N	June Barrow-Green	\N
636	\N	Imre Leader	\N
637	\N	Brian Cox	\N
638	\N	Jeff Forshaw	\N
639	\N	Matthew Goodman	\N
640	\N	Lee Smolin	\N
641	\N	Tim Flannery	\N
642	\N	Kevin Kelly	\N
643	\N	Steven Johnson	\N
644	\N	Steve Toltz	\N
645	\N	Monica Ali	\N
646	\N	Emma Donoghue	\N
647	\N	Tan Twan Eng	\N
648	\N	Sarah Waters	\N
649	\N	Indra Sinha	\N
650	\N	Clare Morrall	\N
651	\N	Achmat Dangor	\N
652	\N	Tom McCarthy	\N
653	\N	M. J. Hyland	\N
654	\N	Vernon God Little	\N
655	\N	Nicola Barker	\N
656	\N	Esi Edugyan	\N
657	\N	Damon Galgut	\N
658	\N	Hisham Matar	\N
659	\N	Carol Birch	\N
660	\N	Yann Martel	\N
661	\N	Edward St Aubyn	\N
662	\N	Jeet Thayil	\N
663	\N	Zöe Heller	\N
664	\N	Stephen Kelman	\N
665	\N	A.D. Miller	\N
666	\N	Deborah Levy	\N
667	\N	Linda Grant	\N
668	\N	Sarah Hall	\N
669	\N	Howard Jacobson	\N
670	\N	Anne Enright	\N
671	\N	Kiran Desai	\N
672	\N	Alison Moore	\N
673	\N	Andrea Levy	\N
674	\N	Philip Hensher	\N
675	\N	Adam Foulds	\N
676	\N	Mohsin Hamid	\N
677	\N	John Banville	\N
678	\N	Kate Grenville	\N
679	\N	Patrick deWitt	\N
680	\N	Aravind Adiga	\N
681	\N	Will Self	\N
682	\N	Joyce Carol Oates	\N
683	\N	T.C. Boyle	\N
684	\N	William T. Vollmann	\N
685	\N	Marianne Wiggins	\N
686	\N	Nicole Krauss	\N
687	\N	Aleksandar Hemon	\N
688	\N	Rene Steinke	\N
689	\N	Karen Tei Yamashita	\N
690	\N	Mischa Berlinski	\N
691	\N	Ken Kalfus	\N
692	\N	Dave Eggers	\N
693	\N	Francine Prose	\N
694	\N	Dana Spiotta	\N
695	\N	Christine Schutt	\N
696	\N	Martha McPhee	\N
697	\N	Susan Straight	\N
698	\N	Scott Spencer	\N
699	\N	Marcel Theroux	\N
700	\N	Bonnie Jo Campbell	\N
701	\N	Dan Chaon	\N
702	\N	Edith Pearlman	\N
703	\N	Joan Silber	\N
704	\N	Ben Fountain	\N
705	\N	Susan Sontag	\N
706	\N	Jayne Anne Phillips	\N
707	\N	Colum McCann	\N
708	\N	Jim Shepard	\N
709	\N	Jennifer Egan	\N
710	\N	Jaimy Gordon	\N
711	\N	Sarah Shun-lien Bynum	\N
712	\N	Mark Z. Danielewski	\N
713	\N	Kate Walbert	\N
714	\N	Jesmyn Ward	\N
715	\N	Peter Matthiessen	\N
716	\N	Lionel Shriver	\N
717	\N	Rachel Kushner	\N
718	\N	Julie Otsuka	\N
719	\N	Alan Lightman	\N
720	\N	Richard Powers	\N
721	\N	Salvatore Scibona	\N
722	\N	Charles Baxter	\N
723	\N	Brad Watson	\N
724	\N	Edward P. Jones	\N
725	\N	Louise Erdrich	\N
726	\N	Lily Tuck	\N
727	\N	Andrew Krivak	\N
728	\N	Kevin Powers	\N
729	\N	Jess Walter	\N
730	\N	Junot Diaz	\N
731	\N	Julia Glass	\N
732	\N	Christopher Sorrentino	\N
733	\N	Lydia Davis	\N
734	\N	Mary Gaitskill	\N
735	\N	Adam Haslett	\N
736	\N	Domingo Martinez	\N
737	\N	Jim Dwyer	\N
738	\N	Kevin Flynn	\N
739	\N	Marie Arana	\N
740	\N	Kevin Boyle	\N
741	\N	Taylor Branch	\N
742	\N	Edwidge Danticat	\N
743	\N	Atul Gawande	\N
744	\N	John W. Dower	\N
745	\N	Patrick Tierney	\N
746	\N	Megan K. Stack	\N
747	\N	Jim Sheeler	\N
748	\N	David M. Carroll	\N
749	\N	Greg Grandin	\N
750	\N	Jacques Barzun	\N
751	\N	Christopher Hitchens	\N
752	\N	Adrienne Mayor	\N
753	\N	Rajiv Chandrasekaran	\N
754	\N	Nathaniel Philbrick	\N
755	\N	Leo Damrosch	\N
756	\N	Patti Smith	\N
757	\N	Jennifer Gonnerman	\N
758	\N	John D'Emilio	\N
759	\N	Mary Gabriel	\N
760	\N	Manning Marable	\N
761	\N	Steve Olson	\N
762	\N	David James Duncan	\N
763	\N	Jan T. Gross	\N
764	\N	Barbara Demick	\N
765	\N	Alan Burdick	\N
766	\N	Lauren Redniss	\N
767	\N	Arnold Rampersad	\N
768	\N	Justin Spring	\N
769	\N	George Howe Colt	\N
770	\N	Alice Kaplan	\N
771	\N	Deborah Baker	\N
772	\N	Erik Larson	\N
773	\N	T.J. Stiles	\N
774	\N	Annette Gordon-Reed	\N
775	\N	Elizabeth Gilbert	\N
776	\N	Nina Bernstein	\N
777	\N	Joan Wickersham	\N
778	\N	Timothy Egan	\N
779	\N	Drew Gilpin Faust	\N
780	\N	Woody Holton	\N
781	\N	David Levering Lewis	\N
782	\N	Carlos Eire	\N
783	\N	David Hackett Fischer	\N
784	\N	Devra Davis	\N
785	\N	Galway Kinnell	\N
786	\N	Ben Lerner	\N
787	\N	Louise Glück	\N
788	\N	David Ferry	\N
789	\N	Lucille Clifton	\N
790	\N	Patricia Smith	\N
791	\N	Cornelius Eady	\N
792	\N	James Richardson	\N
793	\N	James McMichael	\N
794	\N	H.L. Hix	\N
795	\N	Donald Justice	\N
796	\N	Reginald Gibbons	\N
797	\N	Bruce Smith	\N
798	\N	Jean Valentine	\N
799	\N	Carl Phillips	\N
800	\N	Tim Seibles	\N
801	\N	Mark Doty	\N
802	\N	Cole Swensen	\N
803	\N	Brendan Galvin	\N
804	\N	Nikky Finney	\N
805	\N	Cynthia Huntington	\N
806	\N	Monica Youn	\N
807	\N	Ruth Stone	\N
808	\N	Kevin Young	\N
809	\N	Terrance Hayes	\N
810	\N	Linda Gregerson	\N
811	\N	Susan Wheeler	\N
812	\N	Wanda Coleman	\N
813	\N	Ellen Bryant Voigt	\N
814	\N	W.S. Merwin	\N
815	\N	Kenneth Koch	\N
816	\N	Alan Shapiro	\N
817	\N	Stanley Plumly	\N
818	\N	C.D. Wright	\N
819	\N	Lyrae Van Clief-Stefanon	\N
820	\N	Ann Lauterbach	\N
821	\N	Alan Dugan	\N
822	\N	Agha Shahid Ali	\N
823	\N	William Heyen	\N
824	\N	Harryette Mullen	\N
825	\N	Carol Muske-Dukes	\N
826	\N	Nathaniel Mackey	\N
827	\N	Frank Bidart	\N
828	\N	Kim Addonizio	\N
829	\N	Yusef Komunyakaa	\N
830	\N	Kathleen Graber	\N
831	\N	David Kirby	\N
832	\N	Vern Rutsala	\N
833	\N	Louis Simpson	\N
834	\N	C.K. Williams	\N
835	\N	Alberto Rios	\N
836	\N	Sharon Olds	\N
837	\N	Charles Simic	\N
838	\N	Gail Mazur	\N
839	\N	Robert Hass	\N
840	\N	Adrienne Rich	\N
841	\N	Keith Waldrop	\N
842	\N	Rae Armantrout	\N
843	\N	John Ashbery	\N
844	\N	Richard Howard	\N
845	\N	Laurie Halse Anderson	\N
846	\N	Deborah Heiligman	\N
847	\N	Franny Billingsley	\N
848	\N	Phillip Hoose	\N
849	\N	Laura McNeal	\N
850	\N	Albert Marrin	\N
851	\N	Thanhha Lai	\N
852	\N	Rita Williams-Garcia	\N
853	\N	Laini Taylor	\N
854	\N	Walter Dean Myers	\N
855	\N	Kathryn Erskine	\N
856	\N	Debby Dahl Edwardson	\N
857	\N	Gary D. Schmidt	\N
858	\N	Paolo Bacigalupi	\N
859	\N	David Small	\N
860	\N	E. Lockhart	\N
861	\N	Tim Tharp	\N
862	\N	Kathi Appelt	\N
863	\N	Judy Blundell	\N
864	\N	Paula Fox	\N
865	\N	Stephen King	\N
866	\N	Toni Morrison	\N
867	\N	Jeannette Walls	\N
868	\N	Roberto Bolaño	\N
869	\N	Lorrie Moore	\N
870	\N	Gary Shteyngart	\N
871	\N	Jonathan Lethem	\N
872	\N	Maile Meloy	\N
873	\N	Chris Ware	\N
874	\N	Steven Millhauser	\N
875	\N	Gabriel García Márquez	\N
876	\N	Michael Thomas	\N
877	\N	Per Petterson	\N
878	\N	Curtis Sittenfeld	\N
879	\N	Marisha Pessl	\N
880	\N	Karen Russell	\N
881	\N	Alfred A. Knopf	\N
882	\N	Eleanor Henderson	\N
883	\N	Chad Harbach	\N
884	\N	Amy Hempel	\N
885	\N	Richard Ford	\N
886	\N	Ann Beattie	\N
887	\N	Jhumpa Lahiri	\N
888	\N	Ha Jin	\N
889	\N	Jennifer Homans	\N
890	\N	Mark Stevens	\N
891	\N	Annalyn Swan	\N
892	\N	Danielle Trussoni	\N
893	\N	Mary Karr	\N
894	\N	Mildred Armstrong Kalish	\N
895	\N	Tony Judt	\N
896	\N	Carol Sklenicka	\N
897	\N	Caroline Alexander	\N
898	\N	Ian Brown	\N
899	\N	Dexter Filkins	\N
900	\N	David Finkel	\N
901	\N	Jonathan Harr	\N
902	\N	Linda Colley	\N
903	\N	David Nasaw	\N
904	\N	Rory Stewart	\N
905	\N	Alex Ross	\N
906	\N	Jim Holt	\N
907	\N	By John Updike	\N
908	\N	David McCullough	\N
909	\N	Colson Whitehead	\N
910	\N	Graham Robb	\N
911	\N	Frances FitzGerald	\N
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('authors_author_id_seq', 911, true);


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY awards (award_id, name, description, image_url) FROM stdin;
1	Booker Prize	\N	\N
2	The Economist	\N	\N
3	Man Booker Prize 	\N	\N
4	National Book Award	\N	\N
5	The New York Times	\N	\N
\.


--
-- Name: awards_award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('awards_award_id_seq', 5, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY books (book_id, title, description, pages, published, language, isbn10, isbn13, image_url) FROM stdin;
1	Atonement	\N	\N	\N	\N	\N	\N	\N
2	English Passengers	\N	\N	\N	\N	\N	\N	\N
3	England, England	\N	\N	\N	\N	\N	\N	\N
4	A Fine Balance	\N	\N	\N	\N	\N	\N	\N
5	Disgrace	\N	\N	\N	\N	\N	\N	\N
6	Master Georgie	\N	\N	\N	\N	\N	\N	\N
7	True History of the Kelly Gang	\N	\N	\N	\N	\N	\N	\N
8	When we were Orphans	\N	\N	\N	\N	\N	\N	\N
9	Alias Grace	\N	\N	\N	\N	\N	\N	\N
10	Amongst Women	\N	\N	\N	\N	\N	\N	\N
11	Amsterdam	\N	\N	\N	\N	\N	\N	\N
12	An Awfully Big Adventure	\N	\N	\N	\N	\N	\N	\N
13	Beside the Ocean of Time	\N	\N	\N	\N	\N	\N	\N
14	Black Dogs	\N	\N	\N	\N	\N	\N	\N
15	Breakfast on Pluto	\N	\N	\N	\N	\N	\N	\N
16	Crossing the River	\N	\N	\N	\N	\N	\N	\N
17	Daughters of the House	\N	\N	\N	\N	\N	\N	\N
18	Europa	\N	\N	\N	\N	\N	\N	\N
19	Every Man for Himself	\N	\N	\N	\N	\N	\N	\N
20	Fasting, Feasting	\N	\N	\N	\N	\N	\N	\N
21	Grace Notes	\N	\N	\N	\N	\N	\N	\N
22	Headlong	\N	\N	\N	\N	\N	\N	\N
23	Hotel World	\N	\N	\N	\N	\N	\N	\N
24	How Late It Was, How Late	\N	\N	\N	\N	\N	\N	\N
25	In Every Face I Meet	\N	\N	\N	\N	\N	\N	\N
26	Knowledge of Angels	\N	\N	\N	\N	\N	\N	\N
27	Last Orders	\N	\N	\N	\N	\N	\N	\N
28	Lies of Silence	\N	\N	\N	\N	\N	\N	\N
29	Morality Play	\N	\N	\N	\N	\N	\N	\N
30	number9dream	\N	\N	\N	\N	\N	\N	\N
31	Our Fathers	\N	\N	\N	\N	\N	\N	\N
32	Oxygen	\N	\N	\N	\N	\N	\N	\N
33	Paddy Clarke Ha Ha Ha	\N	\N	\N	\N	\N	\N	\N
34	Paradise	\N	\N	\N	\N	\N	\N	\N
35	Possession	\N	\N	\N	\N	\N	\N	\N
36	Quarantine	\N	\N	\N	\N	\N	\N	\N
37	Reading in the Dark	\N	\N	\N	\N	\N	\N	\N
38	Reading Turgenev (from Two Lives)	\N	\N	\N	\N	\N	\N	\N
39	Reef	\N	\N	\N	\N	\N	\N	\N
40	Remembering Babylon	\N	\N	\N	\N	\N	\N	\N
41	Sacred Hunger	\N	\N	\N	\N	\N	\N	\N
42	Scar Tissue	\N	\N	\N	\N	\N	\N	\N
43	Serenity House	\N	\N	\N	\N	\N	\N	\N
44	Solomon Gursky Was Here	\N	\N	\N	\N	\N	\N	\N
45	Such a Long Journey	\N	\N	\N	\N	\N	\N	\N
46	The Blackwater Lightship	\N	\N	\N	\N	\N	\N	\N
47	The Blind Assassin	\N	\N	\N	\N	\N	\N	\N
48	The Butcher Boy	\N	\N	\N	\N	\N	\N	\N
49	The Dark Room	\N	\N	\N	\N	\N	\N	\N
50	The Deposition of Father McGreevy	\N	\N	\N	\N	\N	\N	\N
51	The English Patient	\N	\N	\N	\N	\N	\N	\N
52	The Essence of the Thing	\N	\N	\N	\N	\N	\N	\N
53	The Famished Road	\N	\N	\N	\N	\N	\N	\N
54	The Folding Star	\N	\N	\N	\N	\N	\N	\N
55	The Gate of Angels	\N	\N	\N	\N	\N	\N	\N
56	The Ghost Road	\N	\N	\N	\N	\N	\N	\N
57	The God of Small Things	\N	\N	\N	\N	\N	\N	\N
58	The Hiding Place	\N	\N	\N	\N	\N	\N	\N
59	The Industry of Souls	\N	\N	\N	\N	\N	\N	\N
60	The Keepers of Truth	\N	\N	\N	\N	\N	\N	\N
61	The Map of Love	\N	\N	\N	\N	\N	\N	\N
62	The Moor’s Last Sigh	\N	\N	\N	\N	\N	\N	\N
63	The Orchard on Fire	\N	\N	\N	\N	\N	\N	\N
64	The Redundancy of Courage	\N	\N	\N	\N	\N	\N	\N
65	The Restraint of Beasts	\N	\N	\N	\N	\N	\N	\N
66	The Riders	\N	\N	\N	\N	\N	\N	\N
67	The Stone Diaries	\N	\N	\N	\N	\N	\N	\N
68	The Underground Man	\N	\N	\N	\N	\N	\N	\N
69	The Van	\N	\N	\N	\N	\N	\N	\N
70	Time’s Arrow	\N	\N	\N	\N	\N	\N	\N
71	Under the Frog	\N	\N	\N	\N	\N	\N	\N
72	Against the Flow	\N	\N	\N	\N	\N	\N	\N
73	Great Houses of London	\N	\N	\N	\N	\N	\N	\N
74	Salon to Biennial: Exhibitions that Made Art History: Volume I, 1863-1959	\N	\N	\N	\N	\N	\N	\N
75	A Royal Affair: George III and his Scandalous Siblings 	\N	\N	\N	\N	\N	\N	\N
76	Alexander Hamilton	\N	\N	\N	\N	\N	\N	\N
77	Alexis de Tocqueville: Prophet of Democracy in the Age of Revolution 	\N	\N	\N	\N	\N	\N	\N
78	Beatrix Potter: A Life in Nature	\N	\N	\N	\N	\N	\N	\N
79	Beautiful Shadow: A Life of Patricia Highsmith	\N	\N	\N	\N	\N	\N	\N
80	Chagall: A Biography	\N	\N	\N	\N	\N	\N	\N
81	Edith Wharton	\N	\N	\N	\N	\N	\N	\N
82	Franklin Delano Roosevelt: Champion of Freedom	\N	\N	\N	\N	\N	\N	\N
83	Gannibal: The Moor of Petersburg	\N	\N	\N	\N	\N	\N	\N
84	God's Architect: Pugin and the Building of Romantic Britain	\N	\N	\N	\N	\N	\N	\N
85	Governor Reagan: His Rise to Power	\N	\N	\N	\N	\N	\N	\N
86	Goya	\N	\N	\N	\N	\N	\N	\N
87	Interesting Times: A Twentieth-Century Life	\N	\N	\N	\N	\N	\N	\N
88	Mao: The Unknown Story	\N	\N	\N	\N	\N	\N	\N
89	Mapping Lives: The Uses of Biography	\N	\N	\N	\N	\N	\N	\N
90	Master of the Senate: The Years of Lyndon Johnson	\N	\N	\N	\N	\N	\N	\N
91	Matisse the Master- A Life of Henri Matisse: The Conquest of Colour, 1909-1954	\N	\N	\N	\N	\N	\N	\N
92	Mellon: An American Life 	\N	\N	\N	\N	\N	\N	\N
93	Nixonland: The Rise of a President and the Fracturing of America	\N	\N	\N	\N	\N	\N	\N
94	Passionate Minds: The Great Love Affair of the Enlightenment 	\N	\N	\N	\N	\N	\N	\N
95	Pushkin: A Biography	\N	\N	\N	\N	\N	\N	\N
96	Soul of the Age: A Biography of the Mind of William Shakespeare	\N	\N	\N	\N	\N	\N	\N
97	Stanley: The Impossible Life of Africa's Greatest Explorer	\N	\N	\N	\N	\N	\N	\N
98	The Architect King: George III and the Culture of the Enlightenment	\N	\N	\N	\N	\N	\N	\N
99	The Life of George Mackay Brown: Through the Eye of a Needle 	\N	\N	\N	\N	\N	\N	\N
100	The Majesty of the Law: Reflections of a Supreme Court Justice	\N	\N	\N	\N	\N	\N	\N
101	The Prince of the City: Giuliani, New York and the Genius of American Life	\N	\N	\N	\N	\N	\N	\N
102	The Pursuit of Victory: The Life and Achievement of Horatio Nelson	\N	\N	\N	\N	\N	\N	\N
103	The Red Count: The Life and Times of Harry Kessler	\N	\N	\N	\N	\N	\N	\N
104	The Wagner Clan: The Saga of Germany's Most Illustrious and Infamous Family	\N	\N	\N	\N	\N	\N	\N
105	Thomas Hardy: The Time-Torn Man 	\N	\N	\N	\N	\N	\N	\N
106	Two Lives: Gertrude and Alice	\N	\N	\N	\N	\N	\N	\N
107	Ulysses S. Grant	\N	\N	\N	\N	\N	\N	\N
108	W.B.Yeats: A Life (Volume II, The Arch-Poet)	\N	\N	\N	\N	\N	\N	\N
109	White Heat: The Friendship of Emily Dickinson & Thomas Wentworth Higginson	\N	\N	\N	\N	\N	\N	\N
110	Wodehouse: A Life	\N	\N	\N	\N	\N	\N	\N
111	Bertie: A Life of Edward VII	\N	\N	\N	\N	\N	\N	\N
112	Charles Dickens: a Life	\N	\N	\N	\N	\N	\N	\N
113	Deng Xiaoping and the Transformation of China	\N	\N	\N	\N	\N	\N	\N
114	Every Love Story is a Ghost Story: A Life of David Foster Wallace	\N	\N	\N	\N	\N	\N	\N
358	HANNIE BENNET	\N	\N	\N	\N	\N	\N	\N
115	Hemingway's Boat: Everything He Loved in Life, and Lost, 1934-1961	\N	\N	\N	\N	\N	\N	\N
116	Lives Like Loaded Guns: Emily Dickinson and Her Family's Feuds	\N	\N	\N	\N	\N	\N	\N
117	Raffles and the Golden Opportunity	\N	\N	\N	\N	\N	\N	\N
118	Rin Tin Tin: The Life and the Legend	\N	\N	\N	\N	\N	\N	\N
119	The Paper Garden: An Artist Begins her Life's Work at 72	\N	\N	\N	\N	\N	\N	\N
120	The Pinecone: The Story of Sarah Losh, Forgotten Romantic Heroine- Antiquarian, Architect and Visionary	\N	\N	\N	\N	\N	\N	\N
121	Thomas Hobbes: Leviathan	\N	\N	\N	\N	\N	\N	\N
122	Titian: His Life	\N	\N	\N	\N	\N	\N	\N
123	Van Gogh: the Life	\N	\N	\N	\N	\N	\N	\N
124	Wanted Women: Faith, Lies and the War on Terror- The Hidden Lives of Ayaan Hirsi Ali and Aafia Siddiqui	\N	\N	\N	\N	\N	\N	\N
125	Louis D. Brandeis: A Life	\N	\N	\N	\N	\N	\N	\N
126	Marx's General: The Revolutionary Life of Friedrich Engels	\N	\N	\N	\N	\N	\N	\N
127	Pops: A Life of Louis Armstrong	\N	\N	\N	\N	\N	\N	\N
128	The Ballad of Dorothy Wordsworth: A Life	\N	\N	\N	\N	\N	\N	\N
129	The Life and Times of Raúl Prebisch, 1901-1986	\N	\N	\N	\N	\N	\N	\N
130	The Secret Lives of Somerset Maugham	\N	\N	\N	\N	\N	\N	\N
131	William Golding: The Man Who Wrote Lord of the Flies	\N	\N	\N	\N	\N	\N	\N
132	Deep in a Dream: The Long Night of Chet Baker	\N	\N	\N	\N	\N	\N	\N
133	Queen: The Life and Music of Dinah Washington	\N	\N	\N	\N	\N	\N	\N
134	On Warne	\N	\N	\N	\N	\N	\N	\N
135	High Financier: The Lives and Time of Siegmund Warburg	\N	\N	\N	\N	\N	\N	\N
136	Joe Wilson and the Creation of Xerox 	\N	\N	\N	\N	\N	\N	\N
137	Martha Inc: The Incredible Story of Martha Stewart Living Omnimedia	\N	\N	\N	\N	\N	\N	\N
138	Myself and Other More Important Matters 	\N	\N	\N	\N	\N	\N	\N
139	The Billionaire Who Wasn't: How Chuck Feeney Secretly Made and Gave Away a Fortune	\N	\N	\N	\N	\N	\N	\N
140	The King of Sunlight: How William Lever Cleaned Up the World	\N	\N	\N	\N	\N	\N	\N
141	Khrushchev: The Man and His Era	\N	\N	\N	\N	\N	\N	\N
142	The Passage of Power: The Years of Lyndon Johnson, Volume 4	\N	\N	\N	\N	\N	\N	\N
143	The World Is What It Is: The Authorised Biography of V.S. Naipaul	\N	\N	\N	\N	\N	\N	\N
144	DisneyWar	\N	\N	\N	\N	\N	\N	\N
145	Poorly Made in China: An Insider's Account of the Tactics Behind China's Production Game	\N	\N	\N	\N	\N	\N	\N
146	Private Empire: Exxon Mobil and American Power	\N	\N	\N	\N	\N	\N	\N
147	The Partnership: The Making of Goldman Sachs	\N	\N	\N	\N	\N	\N	\N
148	The Recurrent Crisis in Corporate Governance	\N	\N	\N	\N	\N	\N	\N
149	The Search: How Google and Its Rivals Rewrote the Rules of Business and Transformed Our Culture	\N	\N	\N	\N	\N	\N	\N
150	The Trillion Dollar Meltdown: Easy Money, High Rollers, and the Great Credit Crash	\N	\N	\N	\N	\N	\N	\N
151	The Wal-Mart Effect: How the World's Most Powerful Company Really Works-and How It's Transforming the American Economy 	\N	\N	\N	\N	\N	\N	\N
152	Money and Power: How Goldman Sachs Came to Rule the World	\N	\N	\N	\N	\N	\N	\N
153	Beyond the Core: Expand Your Market Without Abandoning Your Roots	\N	\N	\N	\N	\N	\N	\N
154	Forces for Good: The Six Practices of High-Impact Nonprofits	\N	\N	\N	\N	\N	\N	\N
155	Globality: Competing with Everyone from Everywhere for Everything	\N	\N	\N	\N	\N	\N	\N
156	Management in 10 Words	\N	\N	\N	\N	\N	\N	\N
157	Mavericks at Work: Why the Most Original Minds in Business Win 	\N	\N	\N	\N	\N	\N	\N
158	Super Crunchers: Why Thinking-by-Numbers Is the New Way to Be Smart	\N	\N	\N	\N	\N	\N	\N
159	The Black Swan: The Impact of the Highly Improbable	\N	\N	\N	\N	\N	\N	\N
160	The Modern Firm: Organisational Design for Performance and Growth	\N	\N	\N	\N	\N	\N	\N
161	The New Industrial Revolution: Consumers, Globalisation and the End of Mass Production	\N	\N	\N	\N	\N	\N	\N
162	What Management Is: How It Works and Why It's Everyone's Business	\N	\N	\N	\N	\N	\N	\N
163	Wikinomics: How Mass Collaboration Changes Everything	\N	\N	\N	\N	\N	\N	\N
164	When Brute Force Fails: How to Have Less Crime and Less Punishment	\N	\N	\N	\N	\N	\N	\N
165	Iphigenia in Forest Hills: Anatomy of a Murder Trial	\N	\N	\N	\N	\N	\N	\N
166	People Who Eat Darkness: The Fate of Lucie Blackman	\N	\N	\N	\N	\N	\N	\N
167	Conspiracy of Fools: A True Story	\N	\N	\N	\N	\N	\N	\N
168	Journey Through Great Britain 	\N	\N	\N	\N	\N	\N	\N
169	Will in the World: How Shakespeare Became Shakespeare	\N	\N	\N	\N	\N	\N	\N
170	Other People's Money: The Corporate Mugging of America	\N	\N	\N	\N	\N	\N	\N
171	The Bottom Billion: Why the Poorest Countries are Failing and What Can Be Done About It	\N	\N	\N	\N	\N	\N	\N
172	The Fortune at the Bottom of the Pyramid: Eradicating Poverty Through Profits	\N	\N	\N	\N	\N	\N	\N
173	Why Nations Fail: The Origins of Power, Prosperity and Poverty	\N	\N	\N	\N	\N	\N	\N
174	Poor Economics: A Radical Rethinking of the Way to Fight Global Poverty	\N	\N	\N	\N	\N	\N	\N
175	Capitalism with Chinese Characteristics: Entrepreneurship and the State	\N	\N	\N	\N	\N	\N	\N
176	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything	\N	\N	\N	\N	\N	\N	\N
177	Global Crises, Global Solutions	\N	\N	\N	\N	\N	\N	\N
178	How Markets Fail: The Logic of Economic Calamities	\N	\N	\N	\N	\N	\N	\N
179	Small is Profitable: The Hidden Economic Benefits of Making Electrical Resources the Right Size	\N	\N	\N	\N	\N	\N	\N
180	The Logic of Life: The Rational Economics of an Irrational World	\N	\N	\N	\N	\N	\N	\N
181	The Origins of Value: The Financial Innovations that Created Modern Capital Markets	\N	\N	\N	\N	\N	\N	\N
182	The Venturesome Economy: How Innovation Sustains Prosperity in a More Connected World	\N	\N	\N	\N	\N	\N	\N
183	Why Globalization Works	\N	\N	\N	\N	\N	\N	\N
184	From Higher Aims to Hired Hands: The Social Transformation of American Business Schools and the Unfulfilled Promise of Management as a Profession	\N	\N	\N	\N	\N	\N	\N
185	Paris Hollywood: Writings on Film	\N	\N	\N	\N	\N	\N	\N
186	How Fiction Works	\N	\N	\N	\N	\N	\N	\N
187	The Possessed: Adventures with Russian Books and the People Who Read Them	\N	\N	\N	\N	\N	\N	\N
188	When I Was a Child I Read Books	\N	\N	\N	\N	\N	\N	\N
189	Pulphead: Essays	\N	\N	\N	\N	\N	\N	\N
190	Winter: Five Windows on the Season	\N	\N	\N	\N	\N	\N	\N
191	1Q84	\N	\N	\N	\N	\N	\N	\N
192	Harry Potter and the Deathly Hallows	\N	\N	\N	\N	\N	\N	\N
193	HARRY POTTER AND THE GOBLET OF FIRE	\N	\N	\N	\N	\N	\N	\N
194	More Money Than God: Hedge Funds and the Making of the New Elite	\N	\N	\N	\N	\N	\N	\N
195	The Art of the Restaurateur	\N	\N	\N	\N	\N	\N	\N
196	As Meat Loves Salt	\N	\N	\N	\N	\N	\N	\N
197	Austerlitz	\N	\N	\N	\N	\N	\N	\N
359	I'll Go to Bed at Noon	\N	\N	\N	\N	\N	\N	\N
198	Balzac and the Little Chinese Seamstress	\N	\N	\N	\N	\N	\N	\N
199	Bring up the Bodies	\N	\N	\N	\N	\N	\N	\N
200	A Little History of British Gardening	\N	\N	\N	\N	\N	\N	\N
201	A Year in the Life of William Shakespeare: 1599	\N	\N	\N	\N	\N	\N	\N
202	Artists in Exile: How Refugees from Twentieth-Century War and Revolution Transformed the American Performing Arts	\N	\N	\N	\N	\N	\N	\N
203	Casting a Spell: The Bamboo Fly Rod and the American Pursuit of Perfection 	\N	\N	\N	\N	\N	\N	\N
204	Edge of Empire: Lives, Culture, and Conquest in the East, 1750-1850	\N	\N	\N	\N	\N	\N	\N
205	Edge of the Orison: In the Traces of John Clare's “Journey out of Essex”	\N	\N	\N	\N	\N	\N	\N
206	Italia Romantica: English Romantics and Italian Freedom	\N	\N	\N	\N	\N	\N	\N
207	Shakespeare Goes to Paris: How the Bard Conquered France	\N	\N	\N	\N	\N	\N	\N
208	The Yellow House: Van Gogh, Gauguin, and Nine Turbulent Weeks in Arles	\N	\N	\N	\N	\N	\N	\N
209	A Jury of Her Peers: American Women Writers from Anne Bradstreet to Annie Proulx	\N	\N	\N	\N	\N	\N	\N
210	The Letters of Samuel Beckett, 1929-1940	\N	\N	\N	\N	\N	\N	\N
211	Showtime: A History of the Broadway Musical Theatre	\N	\N	\N	\N	\N	\N	\N
212	Sweetness and Blood: How Surfing Spread from Hawaii and California to the Rest of the World, With Some Unexpected Results	\N	\N	\N	\N	\N	\N	\N
213	The Better Angels of our Nature: Why Violence Has Declined	\N	\N	\N	\N	\N	\N	\N
214	Corn and Capitalism: How a Botanical Bastard Grew to Global Dominance	\N	\N	\N	\N	\N	\N	\N
215	Freedom’s Forge: How American Business Produced Victory in World War II	\N	\N	\N	\N	\N	\N	\N
216	Lords of Finance: The Bankers Who Broke the World	\N	\N	\N	\N	\N	\N	\N
217	Medici Money: Banking, Metaphysics, and Art in Fifteenth-Century Florence	\N	\N	\N	\N	\N	\N	\N
218	Mr China: A Wall Street Banker, an Englishman, an ex-Red Guard and $418,000,000 Disappearing Day by Day	\N	\N	\N	\N	\N	\N	\N
219	The Big Short: Inside the Doomsday Machine	\N	\N	\N	\N	\N	\N	\N
220	The Last Tycoons: The Secret History of Lazard Frères & Co- A Tale of Unrestrained Ambition, Billion-Dollar Fortunes, Byzantine Power Struggles, and Hidden Scandal	\N	\N	\N	\N	\N	\N	\N
221	Too Big to Fail: The Inside Story of How Wall Street and Washington Fought to Save the Financial Systems- and Themselves	\N	\N	\N	\N	\N	\N	\N
222	Reckless Endangerment: How Outsized Ambition, Greed, and Corruption Led to Economic Armageddon	\N	\N	\N	\N	\N	\N	\N
223	The Great Stagnation: How America Ate All the Low-Hanging Fruit of Modern History, Got Sick, and Will (Eventually) Feel Better	\N	\N	\N	\N	\N	\N	\N
224	1688: The First Modern Revolution	\N	\N	\N	\N	\N	\N	\N
225	1967: Israel, the War and the Year that Transformed the Middle East	\N	\N	\N	\N	\N	\N	\N
226	A Great Improvisation: Franklin, France, and the Birth of America	\N	\N	\N	\N	\N	\N	\N
227	A History of the World in 100 Objects	\N	\N	\N	\N	\N	\N	\N
228	A Life in Secrets: The Story of Vera Atkins and the Lost Agents of SOE	\N	\N	\N	\N	\N	\N	\N
229	A Splendid Exchange: How Trade Shaped the World	\N	\N	\N	\N	\N	\N	\N
230	Agincourt: The King, the Campaign, the Battle	\N	\N	\N	\N	\N	\N	\N
231	All the Shah's Men: An American Coup and the Roots of Middle East Terror	\N	\N	\N	\N	\N	\N	\N
232	American Rifle: A Biography	\N	\N	\N	\N	\N	\N	\N
233	Berlin 1961: Kennedy, Khrushchev, and the Most Dangerous Place on Earth	\N	\N	\N	\N	\N	\N	\N
234	Bitter Bonds: A Colonial Divorce Drama of the Seventeenth Century	\N	\N	\N	\N	\N	\N	\N
235	Black Earth: A Journey Through Russia After the Fall	\N	\N	\N	\N	\N	\N	\N
236	Bloodlands: Europe between Hitler and Stalin	\N	\N	\N	\N	\N	\N	\N
237	Byzantium: The Surprising Life of a Medieval Empire	\N	\N	\N	\N	\N	\N	\N
238	Castles of Steel: Britain, Germany, and the Winning of the Great War at Sea	\N	\N	\N	\N	\N	\N	\N
239	Crossroads of Freedom: Antietam, the Battle that Changed the Course of the Civil War	\N	\N	\N	\N	\N	\N	\N
240	Empires of the Sea: The Siege of Malta, the Battle of Lepanto, and the Contest for the Centre of the World	\N	\N	\N	\N	\N	\N	\N
241	Freedom for the Thought that We Hate: A Biography of the First Amendment	\N	\N	\N	\N	\N	\N	\N
242	God and Gold: Britain, America and the Making of the Modern World	\N	\N	\N	\N	\N	\N	\N
243	God's Secretaries: The Making of the King James Bible	\N	\N	\N	\N	\N	\N	\N
244	Imperial Reckoning: The Untold Story of the End of Empire in Kenya	\N	\N	\N	\N	\N	\N	\N
245	In Tasmania	\N	\N	\N	\N	\N	\N	\N
246	Jerusalem: the Biography	\N	\N	\N	\N	\N	\N	\N
247	Khrushchev's Cold War: The Inside Story of an American Adversary 	\N	\N	\N	\N	\N	\N	\N
248	Legacy of Ashes: The History of the CIA	\N	\N	\N	\N	\N	\N	\N
249	Mao's Great Famine: The History of China's Most Devastating Catastrophe, 1958-1962	\N	\N	\N	\N	\N	\N	\N
250	Masters and Commanders: How Roosevelt, Churchill, Marshall and Alanbrooke Won the War in the West	\N	\N	\N	\N	\N	\N	\N
251	Maximum City: Bombay Lost and Found	\N	\N	\N	\N	\N	\N	\N
252	Microcosm: Portrait of a Central European City	\N	\N	\N	\N	\N	\N	\N
253	Modern China: The Fall and Rise of a Great Power, 1850 to the Present	\N	\N	\N	\N	\N	\N	\N
254	Napoleon's Wars: An International History, 1803-1815	\N	\N	\N	\N	\N	\N	\N
255	Out of Mao's Shadow: The Struggle for the Soul of a New China	\N	\N	\N	\N	\N	\N	\N
256	Pearl Buck in China: Journey to the Good Earth	\N	\N	\N	\N	\N	\N	\N
257	Red Plenty: Industry! Progress! Abundance! Inside the Fifties' Soviet Dream	\N	\N	\N	\N	\N	\N	\N
258	Reformation: Europe's House Divided 1490-1700	\N	\N	\N	\N	\N	\N	\N
259	Rough Crossings: Britain, the Slaves and the American Revolution	\N	\N	\N	\N	\N	\N	\N
260	Russia Against Napoleon: The Battle for Europe, 1807 to 1814	\N	\N	\N	\N	\N	\N	\N
261	Scotland: The Autobiography—2,000 Years of Scottish History by Those Who Saw it Happen	\N	\N	\N	\N	\N	\N	\N
262	Seven Myths of the Spanish Conquest	\N	\N	\N	\N	\N	\N	\N
263	Sons of the Conquerors: The Rise of the Turkic World	\N	\N	\N	\N	\N	\N	\N
264	The Afrikaners: Biography of a People	\N	\N	\N	\N	\N	\N	\N
265	The Age of Wonder: How the Romantic Generation Discovered the Beauty and Terror of Science	\N	\N	\N	\N	\N	\N	\N
266	The Anatomy of a Moment: Thirty-five Minutes in History and Imagination	\N	\N	\N	\N	\N	\N	\N
267	The Arabs: A History	\N	\N	\N	\N	\N	\N	\N
268	The Battle for Spain: The Spanish Civil War 1936-1939 	\N	\N	\N	\N	\N	\N	\N
269	The Billy Ruffian: The Bellerophon and the Downfall of Napoleon—The Biography of a Ship of the Line, 1782-1836	\N	\N	\N	\N	\N	\N	\N
270	The Blackest Streets: The Life and Death of a Victorian Slum	\N	\N	\N	\N	\N	\N	\N
271	The British Industrial Revolution in Global Perspective	\N	\N	\N	\N	\N	\N	\N
272	The Cigarette Century: The Rise, Fall, and Deadly Persistence of the Product that Defined America	\N	\N	\N	\N	\N	\N	\N
273	The Command of the Ocean: A Naval History of Britain, 1649-1815. 	\N	\N	\N	\N	\N	\N	\N
274	The Eagle Unbowed: Poland and the Poles in the Second World War	\N	\N	\N	\N	\N	\N	\N
275	The Fall of Hong Kong: Britain, China and the Japanese Occupation	\N	\N	\N	\N	\N	\N	\N
276	The Grand Slave Emporium: Cape Coast Castle and the British Slave Trade	\N	\N	\N	\N	\N	\N	\N
277	The Great Sea: A Human History of the Mediterranean	\N	\N	\N	\N	\N	\N	\N
278	The Italian Boy: Murder and Grave-Robbery in 1830s London	\N	\N	\N	\N	\N	\N	\N
279	The Last Valley: Dien Bien Phu and the French Defeat in Vietnam	\N	\N	\N	\N	\N	\N	\N
280	The Making of Victorian Values: Decency and Dissent in Britain, 1789-1837	\N	\N	\N	\N	\N	\N	\N
281	The Noble Revolt: The Overthrow of Charles I	\N	\N	\N	\N	\N	\N	\N
282	The Pursuit of Italy: A History of a Land, its Regions and their Peoples	\N	\N	\N	\N	\N	\N	\N
283	The Return of History and the End of Dreams	\N	\N	\N	\N	\N	\N	\N
284	The Rise of American Democracy: Jefferson to Lincoln	\N	\N	\N	\N	\N	\N	\N
285	The Storm of War: A New History of the Second World War	\N	\N	\N	\N	\N	\N	\N
286	The Sugar Barons: Family, Corruption, Empire, and War in the West Indies	\N	\N	\N	\N	\N	\N	\N
287	The Trial of Queen Caroline: The Scandalous Affair that Nearly Ended a Monarchy 	\N	\N	\N	\N	\N	\N	\N
288	The Verneys: A True Story of Love, War and Madness in Seventeenth-Century England	\N	\N	\N	\N	\N	\N	\N
289	The Victorians	\N	\N	\N	\N	\N	\N	\N
290	The Wages of Destruction: The Making and Breaking of the Nazi Economy	\N	\N	\N	\N	\N	\N	\N
291	The Warmth of Other Suns: The Epic Story of America's Great Migration	\N	\N	\N	\N	\N	\N	\N
292	The White War: Life and Death on the Italian Front 1915-1919	\N	\N	\N	\N	\N	\N	\N
293	They Marched into Sunlight: War and Peace, Vietnam and America, October 1967	\N	\N	\N	\N	\N	\N	\N
294	Tombstone: The Great Chinese Famine 1958-1962	\N	\N	\N	\N	\N	\N	\N
295	Twelve Days: The Story of the 1956 Hungarian Revolution	\N	\N	\N	\N	\N	\N	\N
296	Unfinished Empire: The Global Expansion of Britain	\N	\N	\N	\N	\N	\N	\N
297	Venice: Fragile City 1797-1997	\N	\N	\N	\N	\N	\N	\N
298	Why the West Rules- For Now: The Patterns of History and What They Reveal About the Future	\N	\N	\N	\N	\N	\N	\N
299	Winston Churchill	\N	\N	\N	\N	\N	\N	\N
300	Iron Curtain: The Crushing of Eastern Europe, 1944-56	\N	\N	\N	\N	\N	\N	\N
301	Bury the Chains: Prophets and Rebels in the Fight to Free an Empire’s Slaves 	\N	\N	\N	\N	\N	\N	\N
302	Gulag: A History	\N	\N	\N	\N	\N	\N	\N
303	When Markets Collide: Investment Strategies for the Age of Global Economic Change	\N	\N	\N	\N	\N	\N	\N
304	Eats, Shoots and Leaves: The Zero Tolerance Approach to Punctuation	\N	\N	\N	\N	\N	\N	\N
305	The Secret Life of Words: How English Became English	\N	\N	\N	\N	\N	\N	\N
306	The Stories of English	\N	\N	\N	\N	\N	\N	\N
307	Through the Language Glass: Why the World Looks Different in Other Languages	\N	\N	\N	\N	\N	\N	\N
308	Is That a Fish in Your Ear?: Translation and the Meaning of Everything	\N	\N	\N	\N	\N	\N	\N
309	Innovation and Its Discontents: How Our Broken Patent System is Endangering Innovation and Progress, and What to Do About It	\N	\N	\N	\N	\N	\N	\N
310	Authentic Leadership: Rediscovering the Secrets to Creating Lasting Value	\N	\N	\N	\N	\N	\N	\N
311	Blue Nights	\N	\N	\N	\N	\N	\N	\N
312	FINISHING THE HAT: Collected Lyrics (1954-1981) With Attendant Comments, Principles, Heresies, ­Grudges, Whines and Anecdotes	\N	\N	\N	\N	\N	\N	\N
313	Ghosts by Daylight: A Memoir of Love, War and Redemption	\N	\N	\N	\N	\N	\N	\N
314	Ivory, Apes & Peacocks: Animals, Adventure and Discovery in the Wild Places of Africa	\N	\N	\N	\N	\N	\N	\N
315	Joseph Anton: a Memoir	\N	\N	\N	\N	\N	\N	\N
316	The Cello Suites: J.S. Bach, Pablo Casals and the Search for a Baroque Masterpiece	\N	\N	\N	\N	\N	\N	\N
317	The Hare with Amber Eyes: A Hidden Inheritance	\N	\N	\N	\N	\N	\N	\N
318	The Richard Burton Diaries	\N	\N	\N	\N	\N	\N	\N
319	Direct Red: A Surgeon's Story	\N	\N	\N	\N	\N	\N	\N
320	A Third Face: My Tale of Writing, Fighting and Filmmaking	\N	\N	\N	\N	\N	\N	\N
321	The Snow Geese: A Story of Home	\N	\N	\N	\N	\N	\N	\N
322	Blood Horses: Notes of a Sportswriter's Son	\N	\N	\N	\N	\N	\N	\N
323	Cold Cream: My Early Life and Other Mistakes	\N	\N	\N	\N	\N	\N	\N
324	Will & Me: How Shakespeare Took Over My Life	\N	\N	\N	\N	\N	\N	\N
325	Outside of a Dog: A Bibliomemoir	\N	\N	\N	\N	\N	\N	\N
326	The Age of Turbulence: Adventures in a New World	\N	\N	\N	\N	\N	\N	\N
327	Running for the Hills: Growing Up on My Mother's Sheep Farm in Wales	\N	\N	\N	\N	\N	\N	\N
328	A Tale of Love and Darkness	\N	\N	\N	\N	\N	\N	\N
329	Fishing in Utopia: Sweden and the Future That Disappeared	\N	\N	\N	\N	\N	\N	\N
330	Giving Up the Ghost: A Memoir	\N	\N	\N	\N	\N	\N	\N
331	Palestinian Walks: Forays into a Vanishing Landscape	\N	\N	\N	\N	\N	\N	\N
332	Persepolis: The Story of a Childhood	\N	\N	\N	\N	\N	\N	\N
333	Pretty Girl in Crimson Rose (8): The Puzzling Memoir of a Man in Love with Words	\N	\N	\N	\N	\N	\N	\N
334	The Ayatollah Begs to Differ: The Paradox of Modern Iran	\N	\N	\N	\N	\N	\N	\N
335	The Year of Magical Thinking	\N	\N	\N	\N	\N	\N	\N
336	Classical Music in America: A History of its Rise and Fall	\N	\N	\N	\N	\N	\N	\N
337	Delta Blues: The Life and Times of the Mississippi Masters Who Revolutionised American Music	\N	\N	\N	\N	\N	\N	\N
338	On Opera	\N	\N	\N	\N	\N	\N	\N
339	The Oxford History of Western Music (six-volume set)	\N	\N	\N	\N	\N	\N	\N
340	Music as Alchemy: Journeys with Great Conductors and their Orchestras	\N	\N	\N	\N	\N	\N	\N
341	How to Be a Bad Birdwatcher	\N	\N	\N	\N	\N	\N	\N
342	Mountains of the Mind: How Desolate and Forbidding Heights Were Transformed into Experiences of Indomitable Spirit	\N	\N	\N	\N	\N	\N	\N
343	The Cloudspotter's Guide: The Science, History and Culture of Clouds 	\N	\N	\N	\N	\N	\N	\N
344	Into the Silence: The Great War, Mallory and the Conquest of Everest	\N	\N	\N	\N	\N	\N	\N
345	Strands: A Year of Discoveries on the Beach	\N	\N	\N	\N	\N	\N	\N
346	The Art of Camping: The History and Practice of Sleeping Under the Stars	\N	\N	\N	\N	\N	\N	\N
347	A Whistling Woman	\N	\N	\N	\N	\N	\N	\N
348	American Rust	\N	\N	\N	\N	\N	\N	\N
349	Big If	\N	\N	\N	\N	\N	\N	\N
350	Breath: A Novel	\N	\N	\N	\N	\N	\N	\N
351	By the Lake	\N	\N	\N	\N	\N	\N	\N
352	Carpentaria	\N	\N	\N	\N	\N	\N	\N
353	Crow Lake	\N	\N	\N	\N	\N	\N	\N
354	Dirt Music	\N	\N	\N	\N	\N	\N	\N
355	Everything is Illuminated	\N	\N	\N	\N	\N	\N	\N
356	Family Matters	\N	\N	\N	\N	\N	\N	\N
357	Freedom	\N	\N	\N	\N	\N	\N	\N
360	Antarctica	\N	\N	\N	\N	\N	\N	\N
361	The Photographs So Far (Volumes 1-4)	\N	\N	\N	\N	\N	\N	\N
362	District and Circle 	\N	\N	\N	\N	\N	\N	\N
363	The Assassins' Gate: America in Iraq	\N	\N	\N	\N	\N	\N	\N
364	The Dark Heart of Italy: Travels Through Space and Time Across Italy	\N	\N	\N	\N	\N	\N	\N
365	The Dark Side: The Inside Story of How the War on Terror Turned into a War on American Ideals	\N	\N	\N	\N	\N	\N	\N
366	The Nine: Inside the Secret World of the Supreme Court	\N	\N	\N	\N	\N	\N	\N
367	The Omnivore's Dilemma: A Natural History of Four Meals	\N	\N	\N	\N	\N	\N	\N
368	The Origins of Sex: A History of the First Sexual Revolution	\N	\N	\N	\N	\N	\N	\N
369	Thinking, Fast and Slow	\N	\N	\N	\N	\N	\N	\N
370	Cloud Atlas	\N	\N	\N	\N	\N	\N	\N
371	How to Stay Sane	\N	\N	\N	\N	\N	\N	\N
372	Adventures in the Orgasmatron: How the Sexual Revolution Came to America	\N	\N	\N	\N	\N	\N	\N
373	Beautiful Thing: Inside the Secret World of Bombay's Dance Bars	\N	\N	\N	\N	\N	\N	\N
374	Triumph of the City: How Our Greatest Invention Makes Us Richer, Smarter, Greener, Healthier and Happier	\N	\N	\N	\N	\N	\N	\N
375	Swim: Why We Love the Water	\N	\N	\N	\N	\N	\N	\N
376	The Secret Race: Inside the Hidden World of the Tour de France- Doping, Cover-Ups and Winning at all Costs	\N	\N	\N	\N	\N	\N	\N
377	Moneyball: The Art of Winning an Unfair Game	\N	\N	\N	\N	\N	\N	\N
378	About Love and Other Stories	\N	\N	\N	\N	\N	\N	\N
379	CALL IF YOU NEED ME: THE UNCOLLECTED FICTION AND PROSE	\N	\N	\N	\N	\N	\N	\N
380	Grown Up Digital: How the Net Generation is Changing Your World	\N	\N	\N	\N	\N	\N	\N
381	The Chains of Heaven: An Ethiopian Romance	\N	\N	\N	\N	\N	\N	\N
382	McGilchrist's Greek Islands	\N	\N	\N	\N	\N	\N	\N
383	Radio Congo: Signals of Hope from Africa’s Deadliest War	\N	\N	\N	\N	\N	\N	\N
384	The Old Ways: A Journey on Foot	\N	\N	\N	\N	\N	\N	\N
385	Schott's Original Miscellany	\N	\N	\N	\N	\N	\N	\N
386	Pattern Recognition	\N	\N	\N	\N	\N	\N	\N
387	ADIEU, MON UNIQUE	\N	\N	\N	\N	\N	\N	\N
388	In Other Rooms, Other Wonders 	\N	\N	\N	\N	\N	\N	\N
389	Jeff in Venice, Death in Varanasi	\N	\N	\N	\N	\N	\N	\N
390	LA FIESTA DEL CHIVO	\N	\N	\N	\N	\N	\N	\N
391	LE MARIAGE	\N	\N	\N	\N	\N	\N	\N
392	Love and Summer	\N	\N	\N	\N	\N	\N	\N
393	Lush Life	\N	\N	\N	\N	\N	\N	\N
394	MARRYING THE MISTRESS	\N	\N	\N	\N	\N	\N	\N
395	Mister Pip	\N	\N	\N	\N	\N	\N	\N
396	Mr Peanut	\N	\N	\N	\N	\N	\N	\N
397	My Name is Red	\N	\N	\N	\N	\N	\N	\N
398	On Chesil Beach	\N	\N	\N	\N	\N	\N	\N
399	Open City	\N	\N	\N	\N	\N	\N	\N
400	Other Country	\N	\N	\N	\N	\N	\N	\N
401	Other People's Money	\N	\N	\N	\N	\N	\N	\N
402	Parrot and Olivier in America	\N	\N	\N	\N	\N	\N	\N
403	Red Dust	\N	\N	\N	\N	\N	\N	\N
404	Sea of Poppies: A Novel	\N	\N	\N	\N	\N	\N	\N
405	Selected Stories	\N	\N	\N	\N	\N	\N	\N
406	SHATTERED	\N	\N	\N	\N	\N	\N	\N
407	Snow	\N	\N	\N	\N	\N	\N	\N
408	Star of the Sea	\N	\N	\N	\N	\N	\N	\N
409	TERRASSE À ROME	\N	\N	\N	\N	\N	\N	\N
410	The Afrika Reich	\N	\N	\N	\N	\N	\N	\N
411	The Amateur Marriage	\N	\N	\N	\N	\N	\N	\N
412	The Cat's Table	\N	\N	\N	\N	\N	\N	\N
413	The Clearing	\N	\N	\N	\N	\N	\N	\N
414	The Curious Incident of the Dog in the Night-Time	\N	\N	\N	\N	\N	\N	\N
415	The Emperor's Children 	\N	\N	\N	\N	\N	\N	\N
416	The Garden of Evening Mists	\N	\N	\N	\N	\N	\N	\N
417	The Ghost	\N	\N	\N	\N	\N	\N	\N
418	The Glass Room	\N	\N	\N	\N	\N	\N	\N
419	The Great Fire	\N	\N	\N	\N	\N	\N	\N
420	The Horned Man	\N	\N	\N	\N	\N	\N	\N
421	The Human Stain	\N	\N	\N	\N	\N	\N	\N
422	The Imperfectionists	\N	\N	\N	\N	\N	\N	\N
423	The Lambs of London	\N	\N	\N	\N	\N	\N	\N
424	The Line of Beauty	\N	\N	\N	\N	\N	\N	\N
425	The March	\N	\N	\N	\N	\N	\N	\N
426	The Marriage Plot	\N	\N	\N	\N	\N	\N	\N
427	The Master	\N	\N	\N	\N	\N	\N	\N
428	The Other Wind	\N	\N	\N	\N	\N	\N	\N
429	The Plot Against America 	\N	\N	\N	\N	\N	\N	\N
430	The Scandal of the Season	\N	\N	\N	\N	\N	\N	\N
431	The Secret Scripture	\N	\N	\N	\N	\N	\N	\N
432	The Septembers of Shiraz	\N	\N	\N	\N	\N	\N	\N
433	The Sweetest Dream	\N	\N	\N	\N	\N	\N	\N
434	The Three of Us: A Family Story	\N	\N	\N	\N	\N	\N	\N
435	The Tiger's Wife	\N	\N	\N	\N	\N	\N	\N
436	The Uncommon Reader	\N	\N	\N	\N	\N	\N	\N
437	The Unnamed	\N	\N	\N	\N	\N	\N	\N
438	The Winter Vault	\N	\N	\N	\N	\N	\N	\N
439	The Yiddish Policemen's Union	\N	\N	\N	\N	\N	\N	\N
440	To the End of the Land	\N	\N	\N	\N	\N	\N	\N
441	Too Much Happiness	\N	\N	\N	\N	\N	\N	\N
442	Train Dreams	\N	\N	\N	\N	\N	\N	\N
443	Ultimatum	\N	\N	\N	\N	\N	\N	\N
444	What I Loved	\N	\N	\N	\N	\N	\N	\N
445	White Teeth	\N	\N	\N	\N	\N	\N	\N
446	Wolf Hall	\N	\N	\N	\N	\N	\N	\N
447	Your Face Tomorrow: Poison, Shadow and Farewell	\N	\N	\N	\N	\N	\N	\N
448	A Short History of Tractors in Ukrainian	\N	\N	\N	\N	\N	\N	\N
449	Brandenburg	\N	\N	\N	\N	\N	\N	\N
450	Everyman 	\N	\N	\N	\N	\N	\N	\N
451	House of Meetings 	\N	\N	\N	\N	\N	\N	\N
452	Incendiary	\N	\N	\N	\N	\N	\N	\N
453	Seven Lies	\N	\N	\N	\N	\N	\N	\N
454	Suite Francais	\N	\N	\N	\N	\N	\N	\N
455	The Meaning of Night: A Confession	\N	\N	\N	\N	\N	\N	\N
456	The Ruby in her Navel	\N	\N	\N	\N	\N	\N	\N
457	The Third Woman	\N	\N	\N	\N	\N	\N	\N
458	Wizard of the Crow	\N	\N	\N	\N	\N	\N	\N
459	Grimm Tales: For Young and Old	\N	\N	\N	\N	\N	\N	\N
460	P L A C E	\N	\N	\N	\N	\N	\N	\N
461	The Dinner	\N	\N	\N	\N	\N	\N	\N
462	The Forgiven	\N	\N	\N	\N	\N	\N	\N
463	Three Strong Women	\N	\N	\N	\N	\N	\N	\N
464	Toby's Room	\N	\N	\N	\N	\N	\N	\N
465	Yellow Tulips: Poems 1968-2011	\N	\N	\N	\N	\N	\N	\N
466	A COMMON HUMANITY: THINKING ABOUT LOVE AND TRUTH AND JUSTICE	\N	\N	\N	\N	\N	\N	\N
467	A LIFE IN THE 20TH CENTURY: INNOCENT BEGINNINGS, 1917-1950	\N	\N	\N	\N	\N	\N	\N
468	ALAN CLARK DIARIES: INTO POLITICS: THE LONG-AWAITED EARLY YEARS	\N	\N	\N	\N	\N	\N	\N
469	BELLOW: A BIOGRAPHY	\N	\N	\N	\N	\N	\N	\N
470	Blood-Dark Track: A Family History	\N	\N	\N	\N	\N	\N	\N
471	BOWLING ALONE: THE COLLAPSE AND REVIVAL OF AMERICAN COMMUNITY	\N	\N	\N	\N	\N	\N	\N
472	British Teeth	\N	\N	\N	\N	\N	\N	\N
473	Building the Cold War	\N	\N	\N	\N	\N	\N	\N
474	CAN JAPAN COMPETE?	\N	\N	\N	\N	\N	\N	\N
764	The Known World	\N	\N	\N	\N	\N	\N	\N
475	Collected Works: A Journal of Jazz 1954-2000	\N	\N	\N	\N	\N	\N	\N
476	Daniel Defoe: Master of Fictions	\N	\N	\N	\N	\N	\N	\N
477	DEAR TOM	\N	\N	\N	\N	\N	\N	\N
478	DEMOCRACY IN EUROPE	\N	\N	\N	\N	\N	\N	\N
479	Divided Jerusalem: The Struggle for the Holy City	\N	\N	\N	\N	\N	\N	\N
480	Economic Sentiments: Adam Smith, Condorcet, and the Enlightenment	\N	\N	\N	\N	\N	\N	\N
481	Endgame in Ireland	\N	\N	\N	\N	\N	\N	\N
482	ERROL FLYNN: SATAN'S ANGEL	\N	\N	\N	\N	\N	\N	\N
483	FATHER AND I	\N	\N	\N	\N	\N	\N	\N
484	FREDERICK THE GREAT	\N	\N	\N	\N	\N	\N	\N
485	HITLER, 1936-1945: NEMESIS	\N	\N	\N	\N	\N	\N	\N
486	HOMAGE TO GAIA	\N	\N	\N	\N	\N	\N	\N
487	How to Write the History of the New World	\N	\N	\N	\N	\N	\N	\N
488	IN THE FOOTSTEPS OF MR KURTZ: LIVING ON THE BRINK OF DISASTER IN THE CONGO	\N	\N	\N	\N	\N	\N	\N
489	India's Development Experience: Selected Writings of S. Guhan	\N	\N	\N	\N	\N	\N	\N
490	IRELAND AND EMPIRE: COLONIAL LEGACIES IN IRISH HISTORY AND CULTURE	\N	\N	\N	\N	\N	\N	\N
491	IRRATIONAL EXUBERANCE	\N	\N	\N	\N	\N	\N	\N
492	JOHN MAYNARD KEYNES: FIGHTING FOR BRITAIN, 1937-46	\N	\N	\N	\N	\N	\N	\N
493	LONDON: THE BIOGRAPHY	\N	\N	\N	\N	\N	\N	\N
494	LUSTGARTEN, PREUSSEN	\N	\N	\N	\N	\N	\N	\N
495	Mind the Gaffe	\N	\N	\N	\N	\N	\N	\N
496	Natasha: The Biography of Natalie Wood	\N	\N	\N	\N	\N	\N	\N
497	One Good Turn: a Natural History of the Screwdriver and the Screw	\N	\N	\N	\N	\N	\N	\N
498	Pleasing Myself	\N	\N	\N	\N	\N	\N	\N
499	Prague 1900: Poetry and Ecstasy	\N	\N	\N	\N	\N	\N	\N
500	Prince of Princes: the Life of Potemkin	\N	\N	\N	\N	\N	\N	\N
501	Sacred Geography	\N	\N	\N	\N	\N	\N	\N
502	Seabiscuit: An American Legend	\N	\N	\N	\N	\N	\N	\N
503	Secret Knowledge: Rediscovering the Lost Techniques of the Old Masters	\N	\N	\N	\N	\N	\N	\N
504	Special Providence: American Foreign Policy and How It Changed the World	\N	\N	\N	\N	\N	\N	\N
505	Speer: The Final Verdict	\N	\N	\N	\N	\N	\N	\N
506	TELECOSM: HOW INFINITE BANDWIDTH WILL REVOLUTIONISE OUR WORLD	\N	\N	\N	\N	\N	\N	\N
507	THE BATTLE	\N	\N	\N	\N	\N	\N	\N
508	THE CATHOLICS OF ULSTER: A HISTORY	\N	\N	\N	\N	\N	\N	\N
509	The City of London, Volume IV: A Club No More (1945-2000)	\N	\N	\N	\N	\N	\N	\N
510	The Coldest March: Scott's Fatal Antarctic Expedition	\N	\N	\N	\N	\N	\N	\N
511	The Difference Engine	\N	\N	\N	\N	\N	\N	\N
512	THE EPHEMERAL MUSEUM: OLD MASTER PAINTINGS AND THE RISE OF THE ART EXHIBITION	\N	\N	\N	\N	\N	\N	\N
513	The First World War, Volume I: To Arms	\N	\N	\N	\N	\N	\N	\N
514	The House of Gucci	\N	\N	\N	\N	\N	\N	\N
515	The Intellectual Life of the British Working Classes	\N	\N	\N	\N	\N	\N	\N
516	The Invention of Clouds: How an Amateur Meteorologist Forged the Language of the Skies	\N	\N	\N	\N	\N	\N	\N
517	The Irish Story: Telling Tales and Making it Up in Ireland	\N	\N	\N	\N	\N	\N	\N
518	THE LETTERS OF KINGSLEY AMIS	\N	\N	\N	\N	\N	\N	\N
519	The London Town Garden 1700-1840	\N	\N	\N	\N	\N	\N	\N
520	The Metaphysical Club: A Story of Ideas in America	\N	\N	\N	\N	\N	\N	\N
521	The Penguin Dictionary of Epigrams	\N	\N	\N	\N	\N	\N	\N
522	Washington	\N	\N	\N	\N	\N	\N	\N
523	Behind the Beautiful Forevers: Life, Death, and Hope in a Mumbai Undercity	\N	\N	\N	\N	\N	\N	\N
524	A World on Fire: An Epic History of Two Nations Divided	\N	\N	\N	\N	\N	\N	\N
525	Chronicles: Volume One	\N	\N	\N	\N	\N	\N	\N
526	Far From the Tree: Parents, Children and the Search for Identity	\N	\N	\N	\N	\N	\N	\N
527	Just Capital	\N	\N	\N	\N	\N	\N	\N
528	KARL POPPER: THE FORMATIVE YEARS, 1902-1945	\N	\N	\N	\N	\N	\N	\N
529	Power and Prosperity: Outgrowing Communist and Capitalist Dictatorships	\N	\N	\N	\N	\N	\N	\N
530	The Looming Tower: Al-Qaeda and the Road to 9/11	\N	\N	\N	\N	\N	\N	\N
531	The Skeptical Environmentalist	\N	\N	\N	\N	\N	\N	\N
532	Uncle Tungsten: Memories of a Chemical Boyhood	\N	\N	\N	\N	\N	\N	\N
533	The Blank Slate: The Modern Denial of Human Nature	\N	\N	\N	\N	\N	\N	\N
534	A Responsibility to Awe	\N	\N	\N	\N	\N	\N	\N
535	Australian Poetry Since 1788	\N	\N	\N	\N	\N	\N	\N
536	Belonging	\N	\N	\N	\N	\N	\N	\N
537	Clavics	\N	\N	\N	\N	\N	\N	\N
538	Electric Light	\N	\N	\N	\N	\N	\N	\N
539	Finders Keepers: Selected Prose 1971-2001	\N	\N	\N	\N	\N	\N	\N
540	Human chain	\N	\N	\N	\N	\N	\N	\N
541	If Not, Winter: Fragments of Sappho	\N	\N	\N	\N	\N	\N	\N
542	Memorial	\N	\N	\N	\N	\N	\N	\N
543	Poems: 1968-1998	\N	\N	\N	\N	\N	\N	\N
544	White Egrets: Poems	\N	\N	\N	\N	\N	\N	\N
545	A Choice of Enemies: America Confronts the Middle East	\N	\N	\N	\N	\N	\N	\N
546	America Unbound: The Bush Revolution in Foreign Policy	\N	\N	\N	\N	\N	\N	\N
547	American Dream: Three Women, Ten Kids, and a Nation's Drive to End Welfare	\N	\N	\N	\N	\N	\N	\N
548	Arsenals of Folly: The Making of the Nuclear Arms Race	\N	\N	\N	\N	\N	\N	\N
549	Britain Since 1918: The Strange Career of British Democracy	\N	\N	\N	\N	\N	\N	\N
550	Cables from Kabul: The Inside Story of the West's Afghanistan Campaign	\N	\N	\N	\N	\N	\N	\N
551	Chain of Command: The Road from 9/11 to Abu Ghraib	\N	\N	\N	\N	\N	\N	\N
552	China Shakes the World: A Titan's Rise and Troubled Future-and the Challenge for America 	\N	\N	\N	\N	\N	\N	\N
553	Country Driving: A Journey Through China from Farm to Factory	\N	\N	\N	\N	\N	\N	\N
554	Curfewed Night: One Kashmiri Journalist's Frontline Account of Life, Love and War in his Homeland	\N	\N	\N	\N	\N	\N	\N
555	Dancing in the Glory of Monsters: The Collapse of the Congo and the Great War of Africa	\N	\N	\N	\N	\N	\N	\N
556	Dangerous Nation: America's Place in the World from its Earliest Days to the Dawn of the Twentieth Century 	\N	\N	\N	\N	\N	\N	\N
557	Days of God: The Revolution in Iran and its Consequences	\N	\N	\N	\N	\N	\N	\N
558	Desperate Glory: At War in Helmand with Britain's 16 Air Assault Brigade	\N	\N	\N	\N	\N	\N	\N
559	Dinner with Mugabe: The Untold Story of a Freedom Fighter Who Became a Tyrant	\N	\N	\N	\N	\N	\N	\N
560	Exceptional People: How Migration Shaped Our World and Will Define Our Future	\N	\N	\N	\N	\N	\N	\N
561	From the Ruins of Empire: The Intellectuals Who Remade Asia	\N	\N	\N	\N	\N	\N	\N
562	Game Change: Obama and the Clintons, McCain and Palin, and the Race of a Lifetime	\N	\N	\N	\N	\N	\N	\N
563	Gomorrah: A Personal Journey into the Violent International Empire of Naples' Organized Crime System	\N	\N	\N	\N	\N	\N	\N
564	Guantánamo and the Abuse of Presidential Power 	\N	\N	\N	\N	\N	\N	\N
565	he Bridge: The Life and Rise of Barack Obama	\N	\N	\N	\N	\N	\N	\N
645	Spillover: Animal Infections and the Next Human Pandemic	\N	\N	\N	\N	\N	\N	\N
566	How Capitalism Was Built: The Transformation of Central and Eastern Europe, Russia, and Central Asia	\N	\N	\N	\N	\N	\N	\N
567	I Didn't Do It For You: How the World Betrayed a Small African Nation	\N	\N	\N	\N	\N	\N	\N
568	In Spite of the Gods: The Rise of Modern India 	\N	\N	\N	\N	\N	\N	\N
569	In the Shadow of Swords: How Islamic Terrorists Declared War on Australia	\N	\N	\N	\N	\N	\N	\N
570	India after Gandhi: The History of the World's Largest Democracy	\N	\N	\N	\N	\N	\N	\N
571	India: The Emerging Giant	\N	\N	\N	\N	\N	\N	\N
572	It's Our Turn to Eat: The Story of a Kenyan Whistleblower	\N	\N	\N	\N	\N	\N	\N
573	Jihad: The Trail of Political Islam	\N	\N	\N	\N	\N	\N	\N
574	Law and the Long War: The Future of Justice in the Age of Terror	\N	\N	\N	\N	\N	\N	\N
575	Molotov's Magic Lantern: A Journey in Russian History	\N	\N	\N	\N	\N	\N	\N
576	Night Draws Near: Iraq's People in the Shadow of America's War	\N	\N	\N	\N	\N	\N	\N
577	Pakistan: a Hard Country	\N	\N	\N	\N	\N	\N	\N
578	Plan of Attack	\N	\N	\N	\N	\N	\N	\N
579	Radicals in Robes: Why Extreme Right-Wing Courts are Wrong for America	\N	\N	\N	\N	\N	\N	\N
580	Random Family: Love, Drugs, Trouble, and Coming of Age in the Bronx	\N	\N	\N	\N	\N	\N	\N
581	Red Capitalism: The Fragile Financial Foundation of China's Extraordinary Rise	\N	\N	\N	\N	\N	\N	\N
582	Rogue Nation: American Unilateralism and the Failure of Good Intentions	\N	\N	\N	\N	\N	\N	\N
583	Sacred Causes: The Clash of Religion and Politics, from the Great War to the War on Terror 	\N	\N	\N	\N	\N	\N	\N
584	Seize the Hour: When Nixon Met Mao 	\N	\N	\N	\N	\N	\N	\N
585	Setting the People Free: The Story of Democracy	\N	\N	\N	\N	\N	\N	\N
586	Surprise, Security, and the American Experience	\N	\N	\N	\N	\N	\N	\N
587	The 9/11 Commission Report: Final Report of the National Commission on Terrorist Attacks Upon the United States	\N	\N	\N	\N	\N	\N	\N
588	The 9/11 Wars	\N	\N	\N	\N	\N	\N	\N
589	The Accidental Guerrilla: Fighting Small Wars in the Midst of a Big One	\N	\N	\N	\N	\N	\N	\N
590	The Art of Political Murder: Who Killed the Bishop?	\N	\N	\N	\N	\N	\N	\N
591	The Atomic Bazaar: The Rise of the Nuclear Poor	\N	\N	\N	\N	\N	\N	\N
592	The Contradictions of American Capital Punishment	\N	\N	\N	\N	\N	\N	\N
593	The Crisis of Islamic Civilisation	\N	\N	\N	\N	\N	\N	\N
594	The Eight O'Clock Ferry to the Windward Side: Seeking Justice in Guantanamo Bay	\N	\N	\N	\N	\N	\N	\N
595	The Emerging Democratic Majority	\N	\N	\N	\N	\N	\N	\N
596	The Fall and Rise of the Islamic State	\N	\N	\N	\N	\N	\N	\N
597	The Fear: The Last Days of Robert Mugabe	\N	\N	\N	\N	\N	\N	\N
598	The Idea of Justice	\N	\N	\N	\N	\N	\N	\N
599	The Immigrant Exodus: Why America is Losing the Global Race to Capture Entrepreneurial Talent	\N	\N	\N	\N	\N	\N	\N
600	The J Curve: A New Way to Understand Why Nations Rise and Fall 	\N	\N	\N	\N	\N	\N	\N
601	The New New Deal: The Hidden Story of Change in the Obama Era	\N	\N	\N	\N	\N	\N	\N
602	The One Percent Doctrine: Deep Inside America's Pursuit of its Enemies Since 9/11 	\N	\N	\N	\N	\N	\N	\N
603	The Paradox of American Power: Why the World's Only Superpower Can't Go It Alone	\N	\N	\N	\N	\N	\N	\N
604	The Party: The Secret World of China's Communist Rulers	\N	\N	\N	\N	\N	\N	\N
605	The Pinch: How the Baby Boomers Took Their Children's Future—and Why They Should Give it Back	\N	\N	\N	\N	\N	\N	\N
606	The Rise of Southern Republicans	\N	\N	\N	\N	\N	\N	\N
607	The Rule of Law	\N	\N	\N	\N	\N	\N	\N
608	The Shield of Achilles: War, Peace and the Course of History	\N	\N	\N	\N	\N	\N	\N
609	The Silence and the Scorpion: The Coup Against Chávez and the Making of Modern Venezuela	\N	\N	\N	\N	\N	\N	\N
610	The Threatening Storm: The Case for Invading Iraq	\N	\N	\N	\N	\N	\N	\N
611	The Three Trillion Dollar War: The True Cost of the Iraq Conflict	\N	\N	\N	\N	\N	\N	\N
612	The Trouble with Africa: Why Foreign Aid Isn't Working 	\N	\N	\N	\N	\N	\N	\N
613	The Watchers: The Rise of America's Surveillance State	\N	\N	\N	\N	\N	\N	\N
614	The Zanzibar Chest: A Story of Life, Love, and Death in Foreign Lands	\N	\N	\N	\N	\N	\N	\N
615	Through the Darkness: A Life in Zimbabwe	\N	\N	\N	\N	\N	\N	\N
616	Tide Players: The Movers and Shakers of a Rising China	\N	\N	\N	\N	\N	\N	\N
617	White Man's Burden: Why the West's Efforts to Aid the Rest Have Done So Much Ill and So Little Good 	\N	\N	\N	\N	\N	\N	\N
618	World on Fire: How Exporting Free Market Democracy Breeds Ethnic Hatred and Global Instability	\N	\N	\N	\N	\N	\N	\N
619	Catching Fire: How Cooking Made Us Human	\N	\N	\N	\N	\N	\N	\N
620	Remarkable Creatures: Epic Adventures in the Search for the Origin of Species	\N	\N	\N	\N	\N	\N	\N
621	The Strangest Man: The Hidden Life of Paul Dirac, Mystic of the Atom	\N	\N	\N	\N	\N	\N	\N
622	Why We Disagree About Climate Change: Understanding Controversy, Inaction and Opportunity	\N	\N	\N	\N	\N	\N	\N
623	A Vast Machine: Computer Models, Climate Data, and the Politics of Global Warming	\N	\N	\N	\N	\N	\N	\N
624	Backroom Boys: The Secret Return of the British Boffin	\N	\N	\N	\N	\N	\N	\N
625	Bad Pharma	\N	\N	\N	\N	\N	\N	\N
626	Bad Science	\N	\N	\N	\N	\N	\N	\N
627	Biology is Technology: The Promise, Peril, and New Business of Engineering Life	\N	\N	\N	\N	\N	\N	\N
628	Collapse: How Societies Choose to Fail or Survive	\N	\N	\N	\N	\N	\N	\N
629	Dr Peter Scardino's Prostate Book: The Complete Guide to Overcoming Prostate Cancer, Prostatitis, and BPH	\N	\N	\N	\N	\N	\N	\N
630	Earth: An Intimate History	\N	\N	\N	\N	\N	\N	\N
631	Eating Apes	\N	\N	\N	\N	\N	\N	\N
632	Einstein's Clocks and Poincaré's Maps: Empires of Time	\N	\N	\N	\N	\N	\N	\N
633	Fatal Misconception: The Struggle to Control World Population	\N	\N	\N	\N	\N	\N	\N
634	Gang Leader for a Day: A Rogue Sociologist Takes to the Streets	\N	\N	\N	\N	\N	\N	\N
635	Global Warming Gridlock: Creating More Effective Strategies for Protecting the Planet	\N	\N	\N	\N	\N	\N	\N
636	Signal and the Noise: Why Most Predictions Fail but Some Don’t, The	\N	\N	\N	\N	\N	\N	\N
637	Jacquard's Web: How a Hand Loom Led to the Birth of the Information Age	\N	\N	\N	\N	\N	\N	\N
638	Nature via Nurture: Genes, Experience and What Makes Us Human	\N	\N	\N	\N	\N	\N	\N
639	Nudge: Improving Decisions About Health, Wealth, and Happiness	\N	\N	\N	\N	\N	\N	\N
640	Ocean of Life: The Fate of Man and the Sea	\N	\N	\N	\N	\N	\N	\N
641	Parallel Worlds: A Journey Through Creation, Higher Dimensions, and the Future of the Cosmos	\N	\N	\N	\N	\N	\N	\N
642	Power, Sex, Suicide: Mitochondria and the Meaning of Life	\N	\N	\N	\N	\N	\N	\N
643	Project Orion: The True Story of the Atomic Spaceship	\N	\N	\N	\N	\N	\N	\N
644	Revolutions that Made the Earth	\N	\N	\N	\N	\N	\N	\N
646	The Beginning of Infinity: Explanations That Transform the World	\N	\N	\N	\N	\N	\N	\N
647	The Big Necessity: The Unmentionable World of Human Waste and Why It Matters	\N	\N	\N	\N	\N	\N	\N
648	The Emperor of All Maladies: A Biography of Cancer	\N	\N	\N	\N	\N	\N	\N
649	The End of the Line: How Over-Fishing is Changing the World and What We Eat	\N	\N	\N	\N	\N	\N	\N
650	The Genome War: How Craig Venter Tried to Capture the Code of Life and Save the World	\N	\N	\N	\N	\N	\N	\N
651	The Glass Bathyscaphe: Glass and World History	\N	\N	\N	\N	\N	\N	\N
652	The God Delusion 	\N	\N	\N	\N	\N	\N	\N
653	The God Species: Saving the Planet in the Age of Humans	\N	\N	\N	\N	\N	\N	\N
654	The Information: A History, a Theory, a Flood	\N	\N	\N	\N	\N	\N	\N
655	The Lunar Men: Five Friends Whose Curiosity Changed the World	\N	\N	\N	\N	\N	\N	\N
656	The Man Who Lost His Language	\N	\N	\N	\N	\N	\N	\N
657	The Measure of All Things: The Seven-Year Odyssey and Hidden Error that Transformed the World	\N	\N	\N	\N	\N	\N	\N
658	The Music of the Primes: Searching to Solve the Greatest Mystery in Mathematics	\N	\N	\N	\N	\N	\N	\N
659	The Princeton Companion to Mathematics	\N	\N	\N	\N	\N	\N	\N
660	The Quantum Universe: Everything That Can Happen Does Happen	\N	\N	\N	\N	\N	\N	\N
661	The Rational Optimist: How Prosperity Evolves	\N	\N	\N	\N	\N	\N	\N
662	The Revenge of Gaia: Earth's Climate Crisis and the Fate of Humanity	\N	\N	\N	\N	\N	\N	\N
663	The Sun and the Moon: The Remarkable True Account of Hoaxers, Showmen, Duelling Journalists, and Lunar Man-Bats in Nineteenth-Century New York	\N	\N	\N	\N	\N	\N	\N
664	The Trouble with Physics: The Rise of String Theory, the Fall of a Science, and What Comes Next	\N	\N	\N	\N	\N	\N	\N
665	The Weather Makers: The History & Future Impact of Climate Change	\N	\N	\N	\N	\N	\N	\N
666	What Technology Wants	\N	\N	\N	\N	\N	\N	\N
667	Where Good Ideas Come From: The Natural History of Innovation	\N	\N	\N	\N	\N	\N	\N
668	A Fraction of the Whole	\N	\N	\N	\N	\N	\N	\N
669	Brick Lane	\N	\N	\N	\N	\N	\N	\N
670	A Long Long Way	\N	\N	\N	\N	\N	\N	\N
671	On Beauty	\N	\N	\N	\N	\N	\N	\N
672	Room 	\N	\N	\N	\N	\N	\N	\N
673	The Little Stranger	\N	\N	\N	\N	\N	\N	\N
674	Animal’s People	\N	\N	\N	\N	\N	\N	\N
675	Arthur and George	\N	\N	\N	\N	\N	\N	\N
676	Astonishing Splashes of Colour	\N	\N	\N	\N	\N	\N	\N
677	Bitter Fruit	\N	\N	\N	\N	\N	\N	\N
678	C	\N	\N	\N	\N	\N	\N	\N
679	Carry Me Down	\N	\N	\N	\N	\N	\N	\N
680	D B C Pierre	\N	\N	\N	\N	\N	\N	\N
681	Darkmans	\N	\N	\N	\N	\N	\N	\N
682	Fingersmith	\N	\N	\N	\N	\N	\N	\N
683	Half Blood Blues	\N	\N	\N	\N	\N	\N	\N
684	I’ll Go To Bed At Noon	\N	\N	\N	\N	\N	\N	\N
685	In a Strange Room	\N	\N	\N	\N	\N	\N	\N
686	In The Country of Men	\N	\N	\N	\N	\N	\N	\N
687	Jamrach’s Menagerie	\N	\N	\N	\N	\N	\N	\N
688	Life of Pi	\N	\N	\N	\N	\N	\N	\N
689	Mother’s Milk	\N	\N	\N	\N	\N	\N	\N
690	Narcopolis	\N	\N	\N	\N	\N	\N	\N
691	Never Let Me Go	\N	\N	\N	\N	\N	\N	\N
692	Notes on a Scandal	\N	\N	\N	\N	\N	\N	\N
693	Oryx and Crake	\N	\N	\N	\N	\N	\N	\N
694	Pigeon English	\N	\N	\N	\N	\N	\N	\N
695	Snowdrops	\N	\N	\N	\N	\N	\N	\N
696	Summertime	\N	\N	\N	\N	\N	\N	\N
697	Swimming Home	\N	\N	\N	\N	\N	\N	\N
698	The Accidental	\N	\N	\N	\N	\N	\N	\N
699	The Children's Book	\N	\N	\N	\N	\N	\N	\N
700	The Clothes on Their Backs	\N	\N	\N	\N	\N	\N	\N
701	The Electric Michelangelo	\N	\N	\N	\N	\N	\N	\N
702	The Finkler	\N	\N	\N	\N	\N	\N	\N
703	The Gathering	\N	\N	\N	\N	\N	\N	\N
704	The Good Doctor	\N	\N	\N	\N	\N	\N	\N
705	The Inheritance of Loss	\N	\N	\N	\N	\N	\N	\N
706	The Lighthouse	\N	\N	\N	\N	\N	\N	\N
707	The Long Song	\N	\N	\N	\N	\N	\N	\N
708	The Night Watch	\N	\N	\N	\N	\N	\N	\N
709	The Northen Clemency	\N	\N	\N	\N	\N	\N	\N
710	The Quickening Maze	\N	\N	\N	\N	\N	\N	\N
711	The Reluctant Fundamentalist	\N	\N	\N	\N	\N	\N	\N
712	The Sea	\N	\N	\N	\N	\N	\N	\N
713	The Secret River	\N	\N	\N	\N	\N	\N	\N
714	The Sense of an Ending	\N	\N	\N	\N	\N	\N	\N
715	The Sisters Brothers	\N	\N	\N	\N	\N	\N	\N
716	The Story of Lucy Gault	\N	\N	\N	\N	\N	\N	\N
717	The White Tiger	\N	\N	\N	\N	\N	\N	\N
718	Umbrella	\N	\N	\N	\N	\N	\N	\N
719	Unless	\N	\N	\N	\N	\N	\N	\N
720	Blonde	\N	\N	\N	\N	\N	\N	\N
721	Drop City	\N	\N	\N	\N	\N	\N	\N
722	Europe Central	\N	\N	\N	\N	\N	\N	\N
723	Evidence of Things Unseen	\N	\N	\N	\N	\N	\N	\N
724	Great House	\N	\N	\N	\N	\N	\N	\N
725	The Lazarus Project	\N	\N	\N	\N	\N	\N	\N
726	Holy Skirts	\N	\N	\N	\N	\N	\N	\N
727	I Hotel 	\N	\N	\N	\N	\N	\N	\N
728	Fieldwork	\N	\N	\N	\N	\N	\N	\N
729	A Disorder Peculiar to the Country	\N	\N	\N	\N	\N	\N	\N
730	A Hologram for the King	\N	\N	\N	\N	\N	\N	\N
731	Blue Angel 	\N	\N	\N	\N	\N	\N	\N
732	Eat the Document 	\N	\N	\N	\N	\N	\N	\N
733	Florida	\N	\N	\N	\N	\N	\N	\N
734	Gorgeous Lies	\N	\N	\N	\N	\N	\N	\N
735	Highwire Moon 	\N	\N	\N	\N	\N	\N	\N
736	Home	\N	\N	\N	\N	\N	\N	\N
737	A Ship Made of Paper	\N	\N	\N	\N	\N	\N	\N
738	Far North	\N	\N	\N	\N	\N	\N	\N
739	American Salvage	\N	\N	\N	\N	\N	\N	\N
740	Among the Missing	\N	\N	\N	\N	\N	\N	\N
741	Binocular Vision 	\N	\N	\N	\N	\N	\N	\N
742	Ideas of Heaven: A Ring of Stories	\N	\N	\N	\N	\N	\N	\N
743	Billy Lynn's Long Halftime Walk	\N	\N	\N	\N	\N	\N	\N
744	In America	\N	\N	\N	\N	\N	\N	\N
745	Lark and Termite	\N	\N	\N	\N	\N	\N	\N
746	Let the Great World Spin	\N	\N	\N	\N	\N	\N	\N
747	Like You’d Understand, Anyway	\N	\N	\N	\N	\N	\N	\N
748	Look at Me	\N	\N	\N	\N	\N	\N	\N
749	Lord of Misrule	\N	\N	\N	\N	\N	\N	\N
750	Madeleine is Sleeping	\N	\N	\N	\N	\N	\N	\N
751	Only Revolutions	\N	\N	\N	\N	\N	\N	\N
752	Our Kind	\N	\N	\N	\N	\N	\N	\N
753	Salvage the Bones 	\N	\N	\N	\N	\N	\N	\N
754	Shadow Country	\N	\N	\N	\N	\N	\N	\N
755	So Much for That 	\N	\N	\N	\N	\N	\N	\N
756	Telex from Cuba	\N	\N	\N	\N	\N	\N	\N
757	The Buddha in the Attic	\N	\N	\N	\N	\N	\N	\N
758	The Corrections	\N	\N	\N	\N	\N	\N	\N
759	The Diagnosis	\N	\N	\N	\N	\N	\N	\N
760	The Echo Maker 	\N	\N	\N	\N	\N	\N	\N
761	The End	\N	\N	\N	\N	\N	\N	\N
762	The Feast of Love	\N	\N	\N	\N	\N	\N	\N
763	The Heaven of Mercury	\N	\N	\N	\N	\N	\N	\N
765	The Last Report on the Miracle at Little No Horse	\N	\N	\N	\N	\N	\N	\N
766	The News from Paraguay 	\N	\N	\N	\N	\N	\N	\N
767	The Round House	\N	\N	\N	\N	\N	\N	\N
768	The Sojourn	\N	\N	\N	\N	\N	\N	\N
769	The Yellow Birds	\N	\N	\N	\N	\N	\N	\N
770	The Zero 	\N	\N	\N	\N	\N	\N	\N
771	Then We Came to the End 	\N	\N	\N	\N	\N	\N	\N
772	This is How You Lose Her	\N	\N	\N	\N	\N	\N	\N
773	Three Junes	\N	\N	\N	\N	\N	\N	\N
774	Trance	\N	\N	\N	\N	\N	\N	\N
775	Tree of Smoke	\N	\N	\N	\N	\N	\N	\N
776	Varieties of Disturbance 	\N	\N	\N	\N	\N	\N	\N
777	Veronica	\N	\N	\N	\N	\N	\N	\N
778	You Are Not a Stranger Here	\N	\N	\N	\N	\N	\N	\N
779	House of Stone: A Memoir of Home, Family, and a Lost Middle East	\N	\N	\N	\N	\N	\N	\N
780	The Boy Kings of Texas	\N	\N	\N	\N	\N	\N	\N
781	102 Minutes: The Untold Story of the Fight to Survive Inside the Twin Towers 	\N	\N	\N	\N	\N	\N	\N
782	American Chica: Two Worlds, One Childhood	\N	\N	\N	\N	\N	\N	\N
783	Arc of Justice: A Saga of Race, Civil Rights, and Murder in the Jazz Age	\N	\N	\N	\N	\N	\N	\N
784	At Canaan’s Edge: America in the King Years, 1965-68	\N	\N	\N	\N	\N	\N	\N
785	Brother, I’m Dying	\N	\N	\N	\N	\N	\N	\N
786	Complications: A Surgeon’s Notes on an Imperfect Science	\N	\N	\N	\N	\N	\N	\N
787	Cultures of War: Pearl Harbor, Hiroshima, 9-11, Iraq	\N	\N	\N	\N	\N	\N	\N
788	Darkness in El Dorado: How Scientists and Journalists Devastated the Amazon	\N	\N	\N	\N	\N	\N	\N
789	Every Man in This Village Is a Liar: An Education in War	\N	\N	\N	\N	\N	\N	\N
790	Final Salute: A Story of Unfinished Lives	\N	\N	\N	\N	\N	\N	\N
791	Following the Water: A Hydromancer's Notebook 	\N	\N	\N	\N	\N	\N	\N
792	Fordlandia: The Rise and Fall of Henry Ford's Forgotten Jungle City	\N	\N	\N	\N	\N	\N	\N
793	From Dawn to Decadence: 500 Years of Western Cultural Life, 1500 to the Present	\N	\N	\N	\N	\N	\N	\N
794	God Is Not Great: How Religion Poisons Everything	\N	\N	\N	\N	\N	\N	\N
795	he Poison King: The Life and Legend of Mithradates, Rome's Deadliest Enemy 	\N	\N	\N	\N	\N	\N	\N
796	Imperial Life in the Emerald City: Inside Iraq’s Green Zone	\N	\N	\N	\N	\N	\N	\N
797	In the Heart of the Sea: The Tragedy of the Whaleship Essex	\N	\N	\N	\N	\N	\N	\N
798	Jean-Jacques Rousseau: Restless Genius	\N	\N	\N	\N	\N	\N	\N
799	Just Kids	\N	\N	\N	\N	\N	\N	\N
800	Life on the Outside: The Prison Odyssey of Elaine Bartlett	\N	\N	\N	\N	\N	\N	\N
801	Lost Prophet: The Life and Times of Bayard Rustin	\N	\N	\N	\N	\N	\N	\N
802	Love and Capital: Karl and Jenny Marx and the Birth of a Revolution	\N	\N	\N	\N	\N	\N	\N
803	Malcolm X: A Life of Reinvention	\N	\N	\N	\N	\N	\N	\N
804	Mapping Human History: Discovering the Past through Our Genes	\N	\N	\N	\N	\N	\N	\N
805	My Story as Told by Water	\N	\N	\N	\N	\N	\N	\N
806	Neighbors: The Destruction of the Jewish Community in Jedwabne, Poland	\N	\N	\N	\N	\N	\N	\N
807	Nothing to Envy: Ordinary Lives in North Korea	\N	\N	\N	\N	\N	\N	\N
808	Oracle Bones: A Journey Between China’s Past and Present 	\N	\N	\N	\N	\N	\N	\N
809	Out of Eden: An Odyssey of Ecological Invasion 	\N	\N	\N	\N	\N	\N	\N
810	Radioactive: Marie & Pierre Curie, A Tale of Love and Fallout 	\N	\N	\N	\N	\N	\N	\N
811	Ralph Ellison: A Biography 	\N	\N	\N	\N	\N	\N	\N
812	Remarkable Creatures: Epic Adventures in the Search for the Origins of Species	\N	\N	\N	\N	\N	\N	\N
813	Secret Historian: The Life and Times of Samuel Steward	\N	\N	\N	\N	\N	\N	\N
814	The 9/11 Commission Report: Final Report of the National Commission on Terrorist Attacks upon the United States- Authorized Edition	\N	\N	\N	\N	\N	\N	\N
815	The Big House: A Century in the Life of an American Summer Home	\N	\N	\N	\N	\N	\N	\N
816	The Collaborator: The Trial and Execution of Robert Brasillach	\N	\N	\N	\N	\N	\N	\N
817	The Convert: A Tale of Exile and Extremism	\N	\N	\N	\N	\N	\N	\N
818	The Devil in the White City: Murder, Magic, and Madness at the Fair that Changed America	\N	\N	\N	\N	\N	\N	\N
819	The First Tycoon: The Epic Life of Cornelius Vanderbilt 	\N	\N	\N	\N	\N	\N	\N
820	The Hemingses of Monticello: An American Family	\N	\N	\N	\N	\N	\N	\N
821	The Last American Man	\N	\N	\N	\N	\N	\N	\N
822	The Lost Children of Wilder: The Epic Struggle to Change Foster Care	\N	\N	\N	\N	\N	\N	\N
823	The Noonday Demon: An Atlas of Depression 	\N	\N	\N	\N	\N	\N	\N
824	The Suicide Index: Putting My Father’s Death in Order	\N	\N	\N	\N	\N	\N	\N
825	The Swerve: How the World Became Modern	\N	\N	\N	\N	\N	\N	\N
826	The Worst Hard Time: The Untold Story of Those Who Survived the Great American Dust Bowl 	\N	\N	\N	\N	\N	\N	\N
827	This Republic of Suffering: Death and the American Civil War	\N	\N	\N	\N	\N	\N	\N
828	Unruly Americans and the Origins of the Constitution	\N	\N	\N	\N	\N	\N	\N
829	W.E.B. Du Bois: The Fight for Equality and the American Century, 1919-1963	\N	\N	\N	\N	\N	\N	\N
830	Waiting for Snow in Havana: Confessions of a Cuban Boy 	\N	\N	\N	\N	\N	\N	\N
831	Washington’s Crossing	\N	\N	\N	\N	\N	\N	\N
832	When Smoke Ran Like Water: Tales of Environmental Deception and the Battle Against Pollution	\N	\N	\N	\N	\N	\N	\N
833	A New Selected Poems	\N	\N	\N	\N	\N	\N	\N
834	Angle of Yaw 	\N	\N	\N	\N	\N	\N	\N
835	Averno 	\N	\N	\N	\N	\N	\N	\N
836	Bewilderment: New Poems and Translations 	\N	\N	\N	\N	\N	\N	\N
837	Blessing the Boats: New and Selected Poems 1988-2000	\N	\N	\N	\N	\N	\N	\N
838	Blood Dazzler 	\N	\N	\N	\N	\N	\N	\N
839	Brutal Imagination	\N	\N	\N	\N	\N	\N	\N
840	By the Numbers	\N	\N	\N	\N	\N	\N	\N
841	Capacity	\N	\N	\N	\N	\N	\N	\N
842	Chromatic 	\N	\N	\N	\N	\N	\N	\N
843	Collected Poems	\N	\N	\N	\N	\N	\N	\N
844	Creatures of a Day 	\N	\N	\N	\N	\N	\N	\N
845	Devotions 	\N	\N	\N	\N	\N	\N	\N
846	Door in the Mountain: New and Collected Poems, 1965-2003 	\N	\N	\N	\N	\N	\N	\N
847	Double Shadow	\N	\N	\N	\N	\N	\N	\N
848	Fast Animal	\N	\N	\N	\N	\N	\N	\N
849	Fire to Fire: New and Selected Poems 	\N	\N	\N	\N	\N	\N	\N
850	Goest	\N	\N	\N	\N	\N	\N	\N
851	Habitat: New and Selected Poems, 1965-2005 	\N	\N	\N	\N	\N	\N	\N
852	Head Off & Split	\N	\N	\N	\N	\N	\N	\N
853	Heavenly Bodies	\N	\N	\N	\N	\N	\N	\N
854	Ignatz 	\N	\N	\N	\N	\N	\N	\N
855	In the Next Galaxy	\N	\N	\N	\N	\N	\N	\N
856	Jelly Roll: A Blues	\N	\N	\N	\N	\N	\N	\N
857	Lighthead	\N	\N	\N	\N	\N	\N	\N
858	Magnetic North	\N	\N	\N	\N	\N	\N	\N
859	Meme	\N	\N	\N	\N	\N	\N	\N
860	Mercurochrome	\N	\N	\N	\N	\N	\N	\N
861	Messenger: New and Selected Poems 1976-2006 	\N	\N	\N	\N	\N	\N	\N
862	Migration: New and Selected Poems 	\N	\N	\N	\N	\N	\N	\N
863	New Addresses: Poems	\N	\N	\N	\N	\N	\N	\N
864	Night of the Republic	\N	\N	\N	\N	\N	\N	\N
865	Old Heart 	\N	\N	\N	\N	\N	\N	\N
866	One with Others 	\N	\N	\N	\N	\N	\N	\N
867	Open Interval	\N	\N	\N	\N	\N	\N	\N
868	Or to Begin Again	\N	\N	\N	\N	\N	\N	\N
869	Poems Seven: New and Complete Poetry 	\N	\N	\N	\N	\N	\N	\N
870	Rooms are Never Finished	\N	\N	\N	\N	\N	\N	\N
871	Shadow of Heaven	\N	\N	\N	\N	\N	\N	\N
872	Shoah Train	\N	\N	\N	\N	\N	\N	\N
873	Sleeping with the Dictionary	\N	\N	\N	\N	\N	\N	\N
874	Sparrow: Poems	\N	\N	\N	\N	\N	\N	\N
875	Speak Low	\N	\N	\N	\N	\N	\N	\N
876	Splay Anthem	\N	\N	\N	\N	\N	\N	\N
877	Star Dust: Poems 	\N	\N	\N	\N	\N	\N	\N
878	Tell Me	\N	\N	\N	\N	\N	\N	\N
879	The Chameleon Couch	\N	\N	\N	\N	\N	\N	\N
880	The Eternal City	\N	\N	\N	\N	\N	\N	\N
881	The House on Boulevard St	\N	\N	\N	\N	\N	\N	\N
882	The Moment’s Equation 	\N	\N	\N	\N	\N	\N	\N
883	The Other Lover	\N	\N	\N	\N	\N	\N	\N
884	The Owner of the House: New Collected Poems 1940-2001	\N	\N	\N	\N	\N	\N	\N
885	The Rest of Love	\N	\N	\N	\N	\N	\N	\N
886	The Singing	\N	\N	\N	\N	\N	\N	\N
887	The Smallest Muscle in the Human Body	\N	\N	\N	\N	\N	\N	\N
888	The Unswept Room	\N	\N	\N	\N	\N	\N	\N
889	The Voice at 3:00 AM: Selected Late and New Poems	\N	\N	\N	\N	\N	\N	\N
890	They Can't Take That Away from Me	\N	\N	\N	\N	\N	\N	\N
891	Time and Materials 	\N	\N	\N	\N	\N	\N	\N
892	Tonight No Poetry Will Serve: Poems 2007-2010	\N	\N	\N	\N	\N	\N	\N
893	Transcendental Studies: A Trilogy	\N	\N	\N	\N	\N	\N	\N
894	Versed 	\N	\N	\N	\N	\N	\N	\N
895	Watching the Spring Festival 	\N	\N	\N	\N	\N	\N	\N
896	Where Shall I Wander 	\N	\N	\N	\N	\N	\N	\N
897	Without Saying 	\N	\N	\N	\N	\N	\N	\N
898	Chains	\N	\N	\N	\N	\N	\N	\N
899	Charles and Emma: The Darwins’ Leap of Faith 	\N	\N	\N	\N	\N	\N	\N
900	Chime 	\N	\N	\N	\N	\N	\N	\N
901	Claudette Colvin: Twice Toward Justice	\N	\N	\N	\N	\N	\N	\N
902	Dark Water	\N	\N	\N	\N	\N	\N	\N
903	Flesh & Blood So Cheap: The Triangle Fire and Its Legacy	\N	\N	\N	\N	\N	\N	\N
904	Inside Out & Back Again	\N	\N	\N	\N	\N	\N	\N
905	Jumped	\N	\N	\N	\N	\N	\N	\N
906	Lips Touch: Three Times	\N	\N	\N	\N	\N	\N	\N
907	Lockdown	\N	\N	\N	\N	\N	\N	\N
908	Mockingbird	\N	\N	\N	\N	\N	\N	\N
909	My Name Is Not Easy 	\N	\N	\N	\N	\N	\N	\N
910	Okay for Now 	\N	\N	\N	\N	\N	\N	\N
911	One Crazy Summer 	\N	\N	\N	\N	\N	\N	\N
912	Ship Breaker	\N	\N	\N	\N	\N	\N	\N
913	Stitches	\N	\N	\N	\N	\N	\N	\N
914	The Disreputable History of Frankie Landau-Banks 	\N	\N	\N	\N	\N	\N	\N
915	The Spectacular Now	\N	\N	\N	\N	\N	\N	\N
916	The Underneath 	\N	\N	\N	\N	\N	\N	\N
917	What I Saw and How I Lied	\N	\N	\N	\N	\N	\N	\N
918	Alexander Hamilton 	\N	\N	\N	\N	\N	\N	\N
919	Borrowed Finery: a memoir	\N	\N	\N	\N	\N	\N	\N
920	11/22/1963	\N	\N	\N	\N	\N	\N	\N
921	A MERCY	\N	\N	\N	\N	\N	\N	\N
922	A SHORT HISTORY OF WOMEN	\N	\N	\N	\N	\N	\N	\N
923	Gilead	\N	\N	\N	\N	\N	\N	\N
924	HALF BROKE HORSES: A True-Life Novel	\N	\N	\N	\N	\N	\N	\N
925	A HEARTBREAKING WORK OF STAGGERING GENIUS	\N	\N	\N	\N	\N	\N	\N
926	2666	\N	\N	\N	\N	\N	\N	\N
927	A GATE AT THE STAIRS	\N	\N	\N	\N	\N	\N	\N
928	A VISIT FROM THE GOON SQUAD	\N	\N	\N	\N	\N	\N	\N
929	ABSURDISTAN	\N	\N	\N	\N	\N	\N	\N
930	CHRONIC CITY	\N	\N	\N	\N	\N	\N	\N
931	BOTH WAYS IS THE ONLY WAY I WANT IT	\N	\N	\N	\N	\N	\N	\N
932	Building Stories	\N	\N	\N	\N	\N	\N	\N
933	DANGEROUS LAUGHTER, Thirteen Stories	\N	\N	\N	\N	\N	\N	\N
934	Kafka on the Shore	\N	\N	\N	\N	\N	\N	\N
935	LIVING TO TELL THE TALE	\N	\N	\N	\N	\N	\N	\N
936	MAN GONE DOWN	\N	\N	\N	\N	\N	\N	\N
937	NETHERLAND	\N	\N	\N	\N	\N	\N	\N
938	NW	\N	\N	\N	\N	\N	\N	\N
939	OUT STEALING HORSES	\N	\N	\N	\N	\N	\N	\N
940	Prep	\N	\N	\N	\N	\N	\N	\N
941	Runaway	\N	\N	\N	\N	\N	\N	\N
942	Saturday	\N	\N	\N	\N	\N	\N	\N
943	SPECIAL TOPICS IN CALAMITY PHYSICS	\N	\N	\N	\N	\N	\N	\N
944	Swamplandia!	\N	\N	\N	\N	\N	\N	\N
945	Ten Thousand Saints	\N	\N	\N	\N	\N	\N	\N
946	The Art of Fielding	\N	\N	\N	\N	\N	\N	\N
947	THE COLLECTED STORIES OF AMY HEMPEL	\N	\N	\N	\N	\N	\N	\N
948	THE FORTRESS OF SOLITUDE	\N	\N	\N	\N	\N	\N	\N
949	THE LAY OF THE LAND	\N	\N	\N	\N	\N	\N	\N
950	The New Yorker Stories 	\N	\N	\N	\N	\N	\N	\N
951	The Savage Detectives	\N	\N	\N	\N	\N	\N	\N
952	UNACCUSTOMED EARTH 	\N	\N	\N	\N	\N	\N	\N
953	War Trash	\N	\N	\N	\N	\N	\N	\N
954	APOLLO’S ANGELS: A History of Ballet	\N	\N	\N	\N	\N	\N	\N
955	Arguably	\N	\N	\N	\N	\N	\N	\N
956	Behind the Beautiful Forevers	\N	\N	\N	\N	\N	\N	\N
957	CLEOPATRA: A Life	\N	\N	\N	\N	\N	\N	\N
958	DE KOONING\r\nAn American Master	\N	\N	\N	\N	\N	\N	\N
959	FALLING THROUGH THE EARTH. A Memoir	\N	\N	\N	\N	\N	\N	\N
960	IMPERIAL LIFE IN THE EMERALD CITY: Inside Iraq's Green Zone	\N	\N	\N	\N	\N	\N	\N
961	LIT: A Memoir	\N	\N	\N	\N	\N	\N	\N
962	LITTLE HEATHENS: Hard Times and High Spirits on an Iowa Farm During the Great Depression	\N	\N	\N	\N	\N	\N	\N
963	Mayflower\r\nA Story of Courage, Community, and War	\N	\N	\N	\N	\N	\N	\N
964	NOTHING TO BE FRIGHTENED OF	\N	\N	\N	\N	\N	\N	\N
965	Postwar\r\nA History of Europe Since 1945	\N	\N	\N	\N	\N	\N	\N
966	Raymond Carver: A Writer’s Life	\N	\N	\N	\N	\N	\N	\N
967	SAMUEL PEPYS: The Unequalled Self	\N	\N	\N	\N	\N	\N	\N
968	THE BOUNTY: The True Story of the Mutiny on the Bounty	\N	\N	\N	\N	\N	\N	\N
969	The Boy in the Moon	\N	\N	\N	\N	\N	\N	\N
970	THE FOREVER WAR	\N	\N	\N	\N	\N	\N	\N
971	THE GOOD SOLDIERS	\N	\N	\N	\N	\N	\N	\N
972	THE LOST PAINTING	\N	\N	\N	\N	\N	\N	\N
973	The Ordeal of Elizabeth Marsh: A Woman in World History	\N	\N	\N	\N	\N	\N	\N
974	The Patriarch	\N	\N	\N	\N	\N	\N	\N
975	The Places in Between	\N	\N	\N	\N	\N	\N	\N
976	THE REST IS NOISE: Listening to the Twentieth Century	\N	\N	\N	\N	\N	\N	\N
977	THE WARMTH OF OTHER SUNS: The Epic Story of America’s Great Migration	\N	\N	\N	\N	\N	\N	\N
978	Why Does the World Exist?	\N	\N	\N	\N	\N	\N	\N
979	BEING DEAD 	\N	\N	\N	\N	\N	\N	\N
980	BEOWULF: A New Verse Translation	\N	\N	\N	\N	\N	\N	\N
981	GENOME: \r\nThe Autobiography of a Species in 23 Chapters	\N	\N	\N	\N	\N	\N	\N
982	Gertrude and Claudius	\N	\N	\N	\N	\N	\N	\N
983	Hateship, Friendship, Courtship, Loveship, Marriage Stories	\N	\N	\N	\N	\N	\N	\N
984	John Adams	\N	\N	\N	\N	\N	\N	\N
985	John Henry Days	\N	\N	\N	\N	\N	\N	\N
986	One Palestine, Complete: \r\nJews and Arabs Under the British Mandate	\N	\N	\N	\N	\N	\N	\N
987	RIMBAUD	\N	\N	\N	\N	\N	\N	\N
988	Way Out There in the Blue: Reagan, Star Wars and the End of the Cold War	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY books_authors (book_author_id, book_id, author_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	10
12	12	10
13	13	11
14	14	11
15	15	12
16	16	13
17	17	14
18	18	15
19	19	15
20	20	16
21	21	17
22	22	18
23	23	19
24	24	20
25	25	21
26	26	22
27	27	23
28	28	24
29	29	25
30	30	26
31	31	27
32	32	28
33	33	29
34	34	30
35	35	31
36	36	32
37	37	33
38	38	34
39	39	35
40	40	36
41	41	36
42	42	37
43	43	38
44	44	39
45	45	39
46	46	40
47	47	40
48	48	40
49	49	41
50	50	42
51	51	43
52	52	44
53	53	45
54	54	46
55	55	47
56	56	48
57	57	49
58	58	50
59	59	51
60	60	52
61	61	53
62	62	54
63	63	55
64	64	56
65	65	57
66	66	58
67	67	59
68	68	60
69	69	60
70	70	61
71	71	62
72	72	63
73	73	64
74	74	65
75	75	66
76	76	67
77	77	68
78	78	69
79	79	70
80	80	71
81	81	72
82	82	73
83	83	74
84	84	75
85	85	76
86	86	77
87	87	78
88	88	79
89	88	80
90	89	81
91	89	82
92	90	83
93	91	84
94	92	85
95	93	86
96	94	87
97	95	88
98	96	89
99	97	90
100	98	91
101	99	92
102	100	93
103	101	94
104	102	95
105	103	96
106	104	97
107	105	98
108	106	99
109	107	100
110	108	101
111	109	102
112	110	103
113	111	104
114	112	104
115	113	105
116	114	106
117	115	107
118	116	108
119	117	109
120	118	110
121	119	111
122	120	112
123	121	113
124	122	114
125	123	115
126	123	116
127	124	117
128	125	118
129	126	119
130	127	120
131	128	121
132	129	122
133	130	123
134	131	124
135	132	125
136	133	126
137	134	127
138	135	128
139	136	129
140	137	130
141	138	131
142	139	132
143	140	133
144	141	134
145	142	134
146	143	135
147	144	136
148	145	137
149	146	138
150	147	138
151	148	139
152	148	140
153	149	141
154	150	142
155	151	143
156	152	144
157	153	145
158	154	146
159	154	147
160	155	148
161	155	149
162	155	150
163	156	151
164	157	152
165	157	153
166	158	154
167	159	155
168	160	156
169	161	157
170	162	158
171	162	159
172	163	160
173	163	161
174	164	162
175	165	162
176	166	163
177	166	164
178	167	165
179	168	166
180	169	167
181	170	168
182	171	169
183	172	170
184	173	171
185	173	172
186	174	173
187	174	174
188	175	175
189	176	176
190	176	177
191	177	178
192	178	179
193	179	180
194	180	181
195	181	182
196	181	183
197	182	184
198	183	185
199	184	186
200	185	187
201	186	188
202	187	189
203	188	190
204	189	191
205	190	192
206	191	193
207	192	194
208	193	194
209	194	195
210	195	196
211	196	197
212	1	197
213	197	198
214	198	199
215	199	200
216	2	200
217	200	200
218	201	201
219	202	202
220	203	203
221	204	204
222	205	205
223	206	206
224	207	207
225	208	208
226	209	209
227	210	210
228	210	211
229	210	212
230	211	213
231	212	214
232	213	215
233	214	216
234	215	217
235	216	218
236	217	218
237	218	219
238	219	220
239	220	220
240	221	221
241	222	222
242	222	223
243	223	224
244	224	225
245	225	226
246	226	227
247	227	228
248	228	229
249	229	230
250	230	231
251	231	232
252	232	233
253	233	234
254	234	235
255	235	236
256	236	237
257	237	238
258	238	239
259	239	240
260	240	241
261	241	242
262	242	243
263	243	244
264	244	245
265	245	246
266	246	247
267	247	248
268	247	249
269	248	250
270	249	251
271	250	252
272	251	253
273	252	254
274	252	255
275	253	256
276	254	257
277	255	258
278	256	258
279	257	259
280	258	260
281	259	261
282	260	262
283	261	263
284	262	264
285	263	265
286	264	266
287	265	267
288	266	268
289	267	269
290	268	270
291	269	271
292	270	272
293	271	273
294	272	274
295	273	275
296	274	276
297	275	277
298	276	277
299	277	278
300	278	278
301	279	279
302	280	280
303	281	281
304	282	282
305	283	283
306	284	284
307	285	284
308	286	285
309	287	286
310	288	287
311	289	288
312	290	289
313	291	290
314	292	291
315	293	292
316	294	293
317	295	294
318	296	295
319	297	296
320	298	297
321	299	298
322	300	299
323	301	300
324	302	300
325	303	301
326	304	302
327	305	303
328	306	304
329	307	305
330	308	306
331	309	307
332	309	308
333	310	309
334	311	310
335	312	311
336	313	312
337	314	313
338	315	313
339	316	314
340	317	315
341	318	316
342	318	317
343	319	318
344	320	319
345	321	320
346	322	320
347	323	321
348	324	322
349	325	323
350	326	324
351	327	325
352	328	326
353	329	327
354	330	327
355	331	328
356	332	329
357	333	330
358	334	331
359	335	331
360	336	331
361	337	332
362	338	333
363	339	334
364	340	335
365	341	336
366	342	337
367	343	338
368	344	339
369	345	340
370	346	341
371	347	342
372	348	343
373	349	344
374	350	344
375	351	344
376	352	345
377	353	346
378	354	346
379	355	347
380	356	347
381	357	348
382	358	349
383	359	350
384	360	351
385	360	352
386	361	353
387	362	354
388	363	355
389	364	356
390	365	357
391	366	358
392	367	359
393	368	360
394	369	361
395	370	361
396	371	362
397	372	363
398	373	364
399	374	365
400	375	366
401	376	367
402	376	368
403	377	367
404	378	369
405	379	370
406	380	370
407	381	371
408	382	372
409	383	373
410	384	373
411	385	374
412	386	375
413	387	376
414	388	377
415	389	378
416	390	379
417	391	380
418	392	380
419	393	381
420	394	382
421	395	383
422	396	384
423	397	385
424	398	385
425	399	386
426	400	387
427	401	387
428	402	387
429	403	388
430	404	389
431	405	389
432	406	390
433	407	390
434	408	391
435	409	392
436	410	393
437	411	394
438	412	394
439	413	395
440	414	396
441	415	397
442	416	398
443	417	399
444	418	400
445	419	401
446	420	402
447	421	403
448	422	404
449	423	405
450	424	405
451	425	406
452	426	407
453	427	407
454	428	408
455	429	408
456	430	409
457	431	410
458	432	411
459	433	412
460	434	413
461	435	414
462	436	415
463	437	416
464	438	417
465	439	418
466	440	419
467	441	420
468	442	421
469	7	421
470	443	422
471	444	423
472	8	423
473	445	424
474	446	424
475	447	425
476	448	426
477	449	427
478	450	427
479	451	427
480	452	428
481	453	428
482	454	429
483	455	430
484	456	430
485	457	431
486	458	432
487	459	433
488	460	434
489	461	435
490	462	436
491	463	437
492	464	437
493	465	438
494	466	439
495	467	440
496	468	441
497	469	442
498	470	443
499	471	444
500	472	445
501	473	446
502	474	447
503	474	448
504	475	449
505	476	450
506	477	451
507	478	452
508	479	453
509	480	454
510	481	455
511	481	456
512	482	457
513	483	458
514	484	459
515	485	460
516	486	461
517	487	462
518	488	463
519	489	464
520	490	465
521	491	466
522	492	467
523	493	467
524	494	468
525	495	469
526	496	470
527	497	471
528	498	472
529	499	473
530	499	474
531	499	475
532	500	473
533	501	476
534	502	477
535	503	478
536	504	478
537	505	479
538	506	480
539	507	481
540	508	482
541	509	483
542	510	484
543	511	485
544	512	486
545	513	487
546	514	488
547	515	489
548	516	490
549	517	490
550	518	491
551	519	492
552	520	493
553	521	494
554	522	495
555	523	496
556	524	497
557	525	498
558	526	499
559	527	500
560	528	501
561	529	502
562	530	503
563	531	503
564	532	504
565	533	504
566	534	505
567	535	506
568	535	507
569	536	508
570	537	509
571	538	509
572	539	509
573	540	509
574	541	510
575	542	511
576	543	512
577	544	513
578	545	514
579	546	515
580	546	516
581	547	517
582	548	518
583	549	519
584	550	520
585	551	521
586	552	522
587	553	523
588	554	524
589	555	525
590	556	525
591	557	526
592	558	527
593	559	528
594	560	529
595	560	530
596	560	531
597	561	532
598	562	533
599	562	534
600	563	535
601	564	536
602	565	537
603	566	538
604	567	538
605	568	539
606	569	540
607	570	541
608	571	542
609	572	542
610	573	543
611	574	544
612	575	545
613	576	546
614	577	547
615	578	548
616	579	549
617	580	550
618	581	551
619	581	552
620	582	553
621	583	554
622	584	555
623	585	556
624	586	557
625	587	558
626	587	559
627	588	560
628	589	561
629	590	562
630	591	563
631	592	564
632	593	565
633	594	566
634	595	567
635	595	568
636	596	569
637	597	570
638	598	571
639	599	572
640	600	573
641	601	574
642	602	575
643	603	576
644	604	577
645	605	578
646	606	579
647	606	580
648	607	581
649	608	582
650	609	583
651	610	584
652	611	585
653	611	586
654	612	587
655	613	588
656	614	589
657	615	590
658	616	591
659	617	592
660	618	593
661	619	594
662	620	595
663	621	596
664	622	597
665	623	598
666	624	599
667	625	600
668	626	600
669	627	601
670	628	602
671	629	603
672	629	604
673	630	605
674	631	606
675	632	607
676	633	608
677	634	609
678	635	610
679	636	611
680	637	612
681	638	613
682	639	614
683	639	549
684	640	615
685	641	616
686	642	617
687	643	618
688	644	619
689	644	620
690	645	621
691	646	622
692	647	623
693	648	624
694	649	625
695	650	626
696	651	627
697	651	628
698	652	629
699	653	630
700	654	631
701	655	631
702	656	631
703	657	632
704	658	633
705	659	634
706	659	635
707	659	636
708	660	637
709	660	638
710	661	637
711	662	637
712	663	639
713	664	640
714	665	641
715	666	642
716	667	643
717	199	643
718	668	644
719	669	645
720	354	645
721	356	645
722	370	645
723	670	645
724	395	645
725	671	645
726	398	645
727	402	645
728	672	646
729	416	647
730	418	647
731	424	647
732	673	648
733	427	648
734	431	648
735	446	648
736	674	649
737	675	649
738	676	650
739	677	651
740	678	652
741	679	653
742	680	654
743	681	655
744	682	655
745	683	656
746	684	656
747	685	657
748	686	658
749	687	659
750	688	660
751	689	661
752	690	662
753	691	662
754	692	663
755	693	663
756	694	664
757	404	664
758	695	665
759	696	665
760	697	666
761	698	666
762	699	666
763	700	667
764	701	668
765	702	669
766	703	670
767	704	670
768	705	671
769	706	672
770	707	673
771	708	673
772	709	674
773	710	675
774	711	676
775	712	677
776	713	678
777	714	678
778	715	679
779	716	679
780	717	680
781	718	681
782	719	681
783	90	681
784	142	681
785	720	682
786	721	683
787	722	684
788	723	685
789	724	686
790	725	687
791	726	688
792	727	689
793	248	689
794	300	689
795	301	689
796	302	689
797	728	690
798	729	691
799	730	692
800	349	692
801	731	693
802	732	694
803	733	695
804	734	696
805	735	697
806	736	697
807	365	697
808	737	698
809	738	699
810	739	700
811	740	701
812	741	702
813	742	703
814	743	704
815	744	705
816	388	705
817	745	706
818	746	707
819	747	708
820	748	709
821	749	710
822	750	711
823	751	712
824	752	713
825	402	713
826	753	714
827	754	715
828	755	716
829	756	717
830	757	718
831	758	718
832	759	719
833	760	720
834	761	721
835	762	722
836	419	722
837	763	723
838	764	724
839	765	725
840	425	725
841	766	726
842	767	726
843	768	727
844	435	727
845	769	728
846	770	729
847	771	729
848	772	730
849	773	731
850	774	732
851	775	732
852	776	733
853	777	734
854	778	735
855	523	735
856	779	735
857	780	736
858	781	737
859	781	738
860	782	739
861	783	740
862	784	741
863	785	742
864	786	743
865	787	744
866	788	745
867	789	746
868	790	747
869	791	748
870	792	749
871	793	750
872	794	751
873	795	752
874	796	753
875	797	754
876	798	755
877	799	756
878	800	757
879	801	758
880	802	759
881	803	760
882	804	761
883	805	762
884	806	763
885	807	764
886	808	764
887	809	765
888	810	766
889	811	767
890	812	767
891	813	768
892	814	768
893	814	559
894	815	769
895	816	770
896	817	771
897	818	772
898	819	773
899	820	774
900	821	775
901	530	775
902	822	776
903	823	776
904	824	777
905	825	777
906	826	778
907	335	778
908	827	779
909	828	780
910	829	781
911	830	782
912	831	783
913	832	784
914	169	784
915	833	785
916	834	786
917	835	787
918	836	788
919	837	789
920	838	790
921	839	791
922	840	792
923	841	793
924	842	794
925	843	795
926	844	796
927	845	797
928	846	798
929	847	799
930	848	800
931	849	801
932	850	802
933	851	803
934	852	804
935	853	805
936	854	806
937	855	807
938	856	808
939	857	809
940	858	810
941	859	811
942	860	812
943	861	813
944	862	814
945	863	815
946	864	816
947	865	817
948	866	818
949	867	819
950	868	820
951	869	821
952	870	822
953	871	822
954	872	823
955	873	824
956	874	825
957	875	825
958	876	826
959	877	827
960	878	828
961	879	829
962	880	830
963	881	831
964	882	832
965	883	832
966	884	833
967	885	833
968	886	834
969	887	835
970	888	836
971	889	837
972	890	838
973	891	839
974	892	840
975	893	841
976	894	842
977	895	842
978	896	843
979	897	844
980	898	845
981	899	846
982	900	847
983	901	848
984	902	849
985	903	850
986	904	851
987	905	852
988	906	853
989	907	854
990	908	855
991	909	856
992	910	857
993	911	857
994	912	858
995	913	859
996	914	860
997	915	861
998	916	862
999	917	863
1000	918	863
1001	919	864
1002	141	864
1003	142	864
1004	920	865
1005	921	866
1006	922	866
1007	197	866
1008	199	866
1009	721	866
1010	923	866
1011	924	867
1012	216	867
1013	265	867
1014	925	867
1015	926	868
1016	927	869
1017	730	869
1018	928	869
1019	929	870
1020	669	870
1021	930	871
1022	357	871
1023	365	871
1024	366	871
1025	367	871
1026	369	871
1027	931	872
1028	932	873
1029	933	874
1030	934	874
1031	935	875
1032	936	876
1033	937	876
1034	938	876
1035	671	876
1036	939	877
1037	940	878
1038	672	878
1039	941	878
1040	942	878
1041	405	878
1042	407	878
1043	943	879
1044	944	880
1045	944	881
1046	945	882
1047	946	883
1048	947	884
1049	758	884
1050	415	884
1051	948	884
1052	421	884
1053	764	884
1054	949	885
1055	427	885
1056	950	886
1057	429	886
1058	951	886
1059	435	886
1060	769	886
1061	771	886
1062	775	886
1063	7	886
1064	952	887
1065	777	887
1066	953	888
1067	445	888
1068	520	888
1069	524	888
1070	954	889
1071	955	889
1072	956	889
1073	525	889
1074	957	889
1075	958	890
1076	958	891
1077	959	892
1078	526	892
1079	312	892
1080	960	892
1081	961	893
1082	962	894
1083	803	894
1084	963	894
1085	964	894
1086	965	895
1087	580	895
1088	966	896
1089	967	896
1090	363	896
1091	968	897
1092	969	898
1093	970	899
1094	971	900
1095	530	900
1096	972	901
1097	973	902
1098	974	903
1099	975	904
1100	976	905
1101	977	905
1102	143	905
1103	335	905
1104	827	905
1105	532	905
1106	831	905
1107	978	906
1108	169	906
1109	648	906
1110	979	906
1111	980	906
1112	981	906
1113	982	907
1114	983	907
1115	984	908
1116	985	909
1117	986	909
1118	987	910
1119	988	911
\.


--
-- Name: books_authors_book_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('books_authors_book_author_id_seq', 1119, true);


--
-- Data for Name: books_awards; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY books_awards (book_award_id, book_id, award_id, year) FROM stdin;
1	1	1	2001
2	2	1	2000
3	3	1	1998
4	4	1	1996
5	5	1	1999
6	6	1	1998
7	7	1	2001
8	8	1	2000
9	9	1	1996
10	10	1	1990
11	11	1	1998
12	12	1	1990
13	13	1	1994
14	14	1	1992
15	15	1	1998
16	16	1	1993
17	17	1	1992
18	18	1	1997
19	19	1	1996
20	20	1	1999
21	21	1	1997
22	22	1	1999
23	23	1	2001
24	24	1	1994
25	25	1	1995
26	26	1	1994
27	27	1	1996
28	28	1	1990
29	29	1	1995
30	30	1	2001
31	31	1	1999
32	32	1	2001
33	33	1	1993
34	34	1	1994
35	35	1	1990
36	36	1	1997
37	37	1	1996
38	38	1	1991
39	39	1	1994
40	40	1	1993
41	41	1	1992
42	42	1	1993
43	43	1	1992
44	44	1	1990
45	45	1	1991
46	46	1	1999
47	47	1	2000
48	48	1	1992
49	49	1	2001
50	50	1	2000
51	51	1	1992
52	52	1	1997
53	53	1	1991
54	54	1	1994
55	55	1	1990
56	56	1	1995
57	57	1	1997
58	58	1	2000
59	59	1	1998
60	60	1	2000
61	61	1	1999
62	62	1	1995
63	63	1	1996
64	64	1	1991
65	65	1	1998
66	66	1	1995
67	67	1	1993
68	68	1	1997
69	69	1	1991
70	70	1	1991
71	71	1	1993
72	72	2	2005
73	73	2	2012
74	74	2	2008
75	75	2	2006
76	76	2	2004
77	77	2	2006
78	78	2	2007
79	79	2	2003
80	80	2	2008
81	81	2	2007
82	82	2	2003
83	83	2	2005
84	84	2	2007
85	85	2	2003
86	86	2	2003
87	87	2	2002
88	88	2	2005
89	89	2	2002
90	90	2	2002
91	91	2	2005
92	92	2	2006
93	93	2	2008
94	94	2	2006
95	95	2	2002
96	96	2	2008
97	97	2	2007
98	98	2	2004
99	99	2	2006
100	100	2	2003
101	101	2	2005
102	102	2	2005
103	103	2	2002
104	104	2	2007
105	105	2	2006
106	106	2	2007
107	107	2	2004
108	108	2	2003
109	109	2	2008
110	110	2	2004
111	111	2	2012
112	112	2	2011
113	113	2	2011
114	114	2	2012
115	115	2	2011
116	116	2	2010
117	117	2	2012
118	118	2	2012
119	119	2	2011
120	120	2	2012
121	121	2	2012
122	122	2	2012
123	123	2	2011
124	124	2	2012
125	125	2	2009
126	126	2	2009
127	127	2	2009
128	128	2	2009
129	129	2	2009
130	130	2	2009
131	131	2	2009
132	132	2	2002
133	133	2	2004
134	134	2	2012
135	135	2	2010
136	136	2	2006
137	137	2	2002
138	138	2	2006
139	139	2	2007
140	140	2	2004
141	141	2	2003
142	142	2	2012
143	143	2	2008
144	144	2	2005
145	145	2	2009
146	146	2	2012
147	147	2	2008
148	148	2	2003
149	149	2	2005
150	150	2	2008
151	151	2	2006
152	152	2	2011
153	153	2	2003
154	154	2	2007
155	155	2	2008
156	156	2	2012
157	157	2	2006
158	158	2	2007
159	159	2	2007
160	160	2	2004
161	161	2	2012
162	162	2	2002
163	163	2	2007
164	164	2	2009
165	165	2	2011
166	166	2	2011
167	167	2	2005
168	168	2	2006
169	169	2	2004
170	170	2	2004
171	171	2	2007
172	172	2	2004
173	173	2	2012
174	174	2	2011
175	175	2	2008
176	176	2	2005
177	177	2	2004
178	178	2	2009
179	179	2	2002
180	180	2	2008
181	181	2	2005
182	182	2	2008
183	183	2	2004
184	184	2	2007
185	185	2	2002
186	186	2	2008
187	187	2	2011
188	188	2	2012
189	189	2	2012
190	190	2	2012
191	191	2	2011
192	192	2	2007
193	193	2	2000
194	194	2	2010
195	195	2	2012
196	196	2	2001
197	1	2	2001
198	197	2	2001
199	198	2	2001
200	199	2	2012
201	2	2	2000
202	200	2	2004
203	201	2	2005
204	202	2	2008
205	203	2	2006
206	204	2	2005
207	205	2	2005
208	206	2	2005
209	207	2	2005
210	208	2	2006
211	209	2	2009
212	210	2	2009
213	211	2	2010
214	212	2	2010
215	213	2	2011
216	214	2	2003
217	215	2	2012
218	216	2	2009
219	217	2	2005
220	218	2	2004
221	219	2	2010
222	220	2	2007
223	221	2	2009
224	222	2	2011
225	223	2	2011
226	224	2	2009
227	225	2	2007
228	226	2	2005
229	227	2	2010
230	228	2	2005
231	229	2	2008
232	230	2	2005
233	231	2	2003
234	232	2	2008
235	233	2	2011
236	234	2	2002
237	235	2	2003
238	236	2	2010
239	237	2	2007
240	238	2	2003
241	239	2	2002
242	240	2	2008
243	241	2	2008
244	242	2	2007
245	243	2	2003
246	244	2	2005
247	245	2	2004
248	246	2	2011
249	247	2	2006
250	248	2	2007
251	249	2	2010
252	250	2	2008
253	251	2	2004
254	252	2	2002
255	253	2	2008
256	254	2	2007
257	255	2	2008
258	256	2	2010
259	257	2	2010
260	258	2	2003
261	259	2	2005
262	260	2	2009
263	261	2	2007
264	262	2	2003
265	263	2	2005
266	264	2	2003
267	265	2	2008
268	266	2	2011
269	267	2	2009
270	268	2	2006
271	269	2	2003
272	270	2	2008
273	271	2	2009
274	272	2	2007
275	273	2	2004
276	274	2	2012
277	275	2	2003
278	276	2	2006
279	277	2	2011
280	278	2	2004
281	279	2	2004
282	280	2	2007
283	281	2	2007
284	282	2	2011
285	283	2	2008
286	284	2	2005
287	285	2	2009
288	286	2	2011
289	287	2	2006
290	288	2	2007
291	289	2	2002
292	290	2	2006
293	291	2	2010
294	292	2	2008
295	293	2	2003
296	294	2	2012
297	295	2	2006
298	296	2	2012
299	297	2	2003
300	298	2	2010
301	299	2	2002
302	300	2	2012
303	301	2	2005
304	302	2	2003
305	303	2	2008
306	304	2	2003
307	305	2	2008
308	306	2	2004
309	307	2	2010
310	308	2	2011
311	309	2	2004
312	310	2	2003
313	311	2	2011
314	312	2	2010
315	313	2	2011
316	314	2	2012
317	315	2	2012
318	316	2	2010
319	317	2	2010
320	318	2	2012
321	319	2	2009
322	320	2	2002
323	321	2	2002
324	322	2	2004
325	323	2	2008
326	324	2	2006
327	325	2	2009
328	326	2	2007
329	327	2	2006
330	328	2	2004
331	329	2	2008
332	330	2	2003
333	331	2	2008
334	332	2	2003
335	333	2	2003
336	334	2	2008
337	335	2	2005
338	336	2	2005
339	337	2	2008
340	338	2	2006
341	339	2	2005
342	340	2	2012
343	341	2	2004
344	342	2	2003
345	343	2	2006
346	344	2	2012
347	345	2	2012
348	346	2	2011
349	347	2	2002
350	348	2	2009
351	349	2	2002
352	350	2	2008
353	351	2	2002
354	352	2	2007
355	353	2	2002
356	354	2	2002
357	355	2	2002
358	356	2	2002
359	357	2	2010
360	358	2	2000
361	359	2	2004
362	360	2	2003
363	361	2	2003
364	362	2	2006
365	363	2	2005
366	364	2	2003
367	365	2	2008
368	366	2	2007
369	367	2	2006
370	368	2	2012
371	369	2	2011
372	370	2	2004
373	371	2	2012
374	372	2	2011
375	373	2	2011
376	374	2	2011
377	375	2	2012
378	376	2	2012
379	377	2	2003
380	378	2	2004
381	379	2	2000
382	380	2	2008
383	381	2	2005
384	382	2	2010
385	383	2	2012
386	384	2	2012
387	385	2	2002
388	386	2	2003
389	387	2	2000
390	388	2	2009
391	389	2	2009
392	390	2	2000
393	391	2	2000
394	392	2	2009
395	393	2	2008
396	394	2	2000
397	395	2	2007
398	396	2	2010
399	397	2	2001
400	398	2	2007
401	399	2	2011
402	400	2	2007
403	401	2	2011
404	402	2	2010
405	403	2	2001
406	404	2	2008
407	405	2	2010
408	406	2	2000
409	407	2	2004
410	408	2	2003
411	409	2	2000
412	410	2	2011
413	411	2	2004
414	412	2	2011
415	413	2	2003
416	414	2	2003
417	415	2	2006
418	416	2	2012
419	417	2	2007
420	418	2	2009
421	419	2	2003
422	420	2	2002
423	421	2	2000
424	422	2	2010
425	423	2	2004
426	424	2	2004
427	425	2	2005
428	426	2	2011
429	427	2	2004
430	428	2	2001
431	429	2	2004
432	430	2	2007
433	431	2	2008
434	432	2	2007
435	433	2	2001
436	434	2	2008
437	435	2	2011
438	436	2	2007
439	437	2	2010
440	438	2	2009
441	439	2	2007
442	440	2	2010
443	441	2	2009
444	442	2	2011
445	7	2	2001
446	443	2	2009
447	444	2	2003
448	8	2	2000
449	445	2	2000
450	446	2	2009
451	447	2	2009
452	448	2	2005
453	449	2	2005
454	450	2	2006
455	451	2	2006
456	452	2	2005
457	453	2	2006
458	454	2	2006
459	455	2	2006
460	456	2	2006
461	457	2	2005
462	458	2	2006
463	459	2	2012
464	460	2	2012
465	461	2	2012
466	462	2	2012
467	463	2	2012
468	464	2	2012
469	465	2	2012
470	466	2	2000
471	467	2	2000
472	468	2	2000
473	469	2	2000
474	470	2	2001
475	471	2	2000
476	472	2	2001
477	473	2	2001
478	474	2	2000
479	475	2	2001
480	476	2	2001
481	477	2	2000
482	478	2	2000
483	479	2	2001
484	480	2	2001
485	481	2	2001
486	482	2	2000
487	483	2	2000
488	484	2	2000
489	485	2	2000
490	486	2	2000
491	487	2	2001
492	488	2	2000
493	489	2	2001
494	490	2	2000
495	491	2	2000
496	492	2	2000
497	493	2	2000
498	494	2	2000
499	495	2	2001
500	496	2	2001
501	497	2	2000
502	498	2	2001
503	499	2	2000
504	500	2	2000
505	501	2	2001
506	502	2	2001
507	503	2	2001
508	504	2	2001
509	505	2	2001
510	506	2	2000
511	507	2	2000
512	508	2	2000
513	509	2	2001
514	510	2	2001
515	511	2	2001
516	512	2	2000
517	513	2	2001
518	514	2	2000
519	515	2	2001
520	516	2	2001
521	517	2	2001
522	518	2	2000
523	519	2	2001
524	520	2	2001
525	521	2	2001
526	522	2	2001
527	523	2	2012
528	524	2	2010
529	525	2	2004
530	526	2	2012
531	527	2	2001
532	528	2	2000
533	529	2	2000
534	530	2	2006
535	531	2	2001
536	532	2	2001
537	533	2	2002
538	534	2	2001
539	535	2	2011
540	536	2	2002
541	537	2	2011
542	538	2	2001
543	539	2	2002
544	540	2	2010
545	541	2	2002
546	542	2	2011
547	543	2	2001
548	544	2	2010
549	545	2	2008
550	546	2	2003
551	547	2	2004
552	548	2	2007
553	549	2	2008
554	550	2	2011
555	551	2	2004
556	552	2	2006
557	553	2	2010
558	554	2	2010
559	555	2	2011
560	556	2	2006
561	557	2	2012
562	558	2	2009
563	559	2	2008
564	560	2	2011
565	561	2	2012
566	562	2	2010
567	563	2	2007
568	564	2	2006
569	565	2	2010
570	566	2	2007
571	567	2	2005
572	568	2	2006
573	569	2	2005
574	570	2	2007
575	571	2	2008
576	572	2	2009
577	573	2	2002
578	574	2	2008
579	575	2	2010
580	576	2	2005
581	577	2	2011
582	578	2	2004
583	579	2	2005
584	580	2	2003
585	581	2	2011
586	582	2	2003
587	583	2	2006
588	584	2	2006
589	585	2	2005
590	586	2	2004
591	587	2	2004
592	588	2	2011
593	589	2	2009
594	590	2	2007
595	591	2	2007
596	592	2	2003
597	593	2	2009
598	594	2	2007
599	595	2	2002
600	596	2	2008
601	597	2	2010
602	598	2	2009
603	599	2	2012
604	600	2	2006
605	601	2	2012
606	602	2	2006
607	603	2	2002
608	604	2	2010
609	605	2	2010
610	606	2	2002
611	607	2	2010
612	608	2	2002
613	609	2	2009
614	610	2	2002
615	611	2	2008
616	612	2	2006
617	613	2	2010
618	614	2	2003
619	615	2	2007
620	616	2	2011
621	617	2	2006
622	618	2	2003
623	619	2	2009
624	620	2	2009
625	621	2	2009
626	622	2	2009
627	623	2	2010
628	624	2	2004
629	625	2	2012
630	626	2	2008
631	627	2	2010
632	628	2	2005
633	629	2	2005
634	630	2	2004
635	631	2	2003
636	632	2	2003
637	633	2	2008
638	634	2	2008
639	635	2	2011
640	636	2	2012
641	637	2	2004
642	638	2	2003
643	639	2	2008
644	640	2	2012
645	641	2	2005
646	642	2	2005
647	643	2	2002
648	644	2	2011
649	645	2	2012
650	646	2	2011
651	647	2	2008
652	648	2	2010
653	649	2	2004
654	650	2	2004
655	651	2	2002
656	652	2	2006
657	653	2	2011
658	654	2	2011
659	655	2	2002
660	656	2	2002
661	657	2	2002
662	658	2	2003
663	659	2	2008
664	660	2	2011
665	661	2	2010
666	662	2	2006
667	663	2	2008
668	664	2	2006
669	665	2	2005
670	666	2	2010
671	667	2	2010
672	199	3	2012
673	668	3	2008
674	669	3	2003
675	354	3	2002
676	356	3	2002
677	370	3	2004
678	670	3	2005
679	395	3	2007
680	671	3	2005
681	398	3	2007
682	402	3	2010
683	672	3	2010
684	416	3	2012
685	418	3	2009
686	424	3	2004
687	673	3	2009
688	427	3	2004
689	431	3	2008
690	446	3	2009
691	674	3	2007
692	675	3	2005
693	676	3	2003
694	677	3	2004
695	678	3	2010
696	679	3	2006
697	680	3	2003
698	681	3	2007
699	682	3	2002
700	683	3	2011
701	684	3	2004
702	685	3	2010
703	686	3	2006
704	687	3	2011
705	688	3	2002
706	689	3	2006
707	690	3	2012
708	691	3	2005
709	692	3	2003
710	693	3	2003
711	694	3	2011
712	404	3	2008
713	695	3	2011
714	696	3	2009
715	697	3	2012
716	698	3	2005
717	699	3	2009
718	700	3	2008
719	701	3	2004
720	702	3	2010
721	703	3	2007
722	704	3	2003
723	705	3	2006
724	706	3	2012
725	707	3	2010
726	708	3	2006
727	709	3	2008
728	710	3	2009
729	711	3	2007
730	712	3	2005
731	713	3	2006
732	714	3	2011
733	715	3	2011
734	716	3	2002
735	717	3	2008
736	718	3	2012
737	719	3	2002
738	90	4	2002
739	142	4	2012
740	720	4	2000
741	721	4	2003
742	722	4	2005
743	723	4	2003
744	724	4	2010
745	725	4	2008
746	726	4	2005
747	727	4	2010
748	248	4	2007
749	300	4	2012
750	301	4	2005
751	302	4	2003
752	728	4	2007
753	729	4	2006
754	730	4	2012
755	349	4	2002
756	731	4	2000
757	732	4	2006
758	733	4	2004
759	734	4	2002
760	735	4	2001
761	736	4	2008
762	365	4	2008
763	737	4	2003
764	738	4	2009
765	739	4	2009
766	740	4	2001
767	741	4	2011
768	742	4	2004
769	743	4	2012
770	744	4	2000
771	388	4	2009
772	745	4	2009
773	746	4	2009
774	747	4	2007
775	748	4	2001
776	749	4	2010
777	750	4	2004
778	751	4	2006
779	752	4	2004
780	402	4	2010
781	753	4	2011
782	754	4	2008
783	755	4	2010
784	756	4	2008
785	757	4	2011
786	758	4	2001
787	759	4	2000
788	760	4	2006
789	761	4	2008
790	762	4	2000
791	419	4	2003
792	763	4	2002
793	764	4	2003
794	765	4	2001
795	425	4	2005
796	766	4	2004
797	767	4	2012
798	768	4	2011
799	435	4	2011
800	769	4	2012
801	770	4	2006
802	771	4	2007
803	772	4	2012
804	773	4	2002
805	774	4	2005
806	775	4	2007
807	776	4	2007
808	777	4	2005
809	778	4	2002
810	523	4	2012
811	779	4	2012
812	780	4	2012
813	781	4	2005
814	782	4	2001
815	783	4	2004
816	784	4	2006
817	785	4	2007
818	786	4	2002
819	787	4	2010
820	788	4	2000
821	789	4	2010
822	790	4	2008
823	791	4	2009
824	792	4	2009
825	793	4	2000
826	794	4	2007
827	795	4	2009
828	796	4	2006
829	797	4	2000
830	798	4	2005
831	799	4	2010
832	800	4	2004
833	801	4	2003
834	802	4	2011
835	803	4	2011
836	804	4	2002
837	805	4	2001
838	806	4	2001
839	807	4	2010
840	808	4	2006
841	809	4	2005
842	810	4	2011
843	811	4	2007
844	812	4	2009
845	813	4	2010
846	814	4	2004
847	815	4	2003
848	816	4	2000
849	817	4	2011
850	818	4	2003
851	819	4	2009
852	820	4	2008
853	821	4	2002
854	530	4	2006
855	822	4	2001
856	823	4	2001
857	824	4	2008
858	825	4	2011
859	826	4	2006
860	335	4	2005
861	827	4	2008
862	828	4	2007
863	829	4	2000
864	830	4	2003
865	831	4	2004
866	832	4	2002
867	169	4	2004
868	833	4	2000
869	834	4	2006
870	835	4	2006
871	836	4	2012
872	837	4	2000
873	838	4	2008
874	839	4	2001
875	840	4	2010
876	841	4	2006
877	842	4	2006
878	843	4	2004
879	844	4	2008
880	845	4	2011
881	846	4	2004
882	847	4	2011
883	848	4	2012
884	849	4	2008
885	850	4	2004
886	851	4	2005
887	852	4	2011
888	853	4	2012
889	854	4	2010
890	855	4	2002
891	856	4	2003
892	857	4	2010
893	858	4	2007
894	859	4	2012
895	860	4	2001
896	861	4	2007
897	862	4	2005
898	863	4	2000
899	864	4	2012
900	865	4	2007
901	866	4	2010
902	867	4	2009
903	868	4	2009
904	869	4	2001
905	870	4	2001
906	871	4	2002
907	872	4	2004
908	873	4	2002
909	874	4	2003
910	875	4	2009
911	876	4	2006
912	877	4	2005
913	878	4	2000
914	879	4	2011
915	880	4	2010
916	881	4	2007
917	882	4	2005
918	883	4	2000
919	884	4	2003
920	885	4	2004
921	886	4	2003
922	887	4	2002
923	888	4	2002
924	889	4	2003
925	890	4	2001
926	891	4	2007
927	892	4	2011
928	893	4	2009
929	894	4	2009
930	895	4	2008
931	896	4	2005
932	897	4	2008
933	898	4	2008
934	899	4	2009
935	900	4	2011
936	901	4	2009
937	902	4	2010
938	903	4	2011
939	904	4	2011
940	905	4	2009
941	906	4	2009
942	907	4	2010
943	908	4	2010
944	909	4	2011
945	910	4	2011
946	911	4	2010
947	912	4	2010
948	913	4	2009
949	914	4	2008
950	915	4	2008
951	916	4	2008
952	917	4	2008
953	918	5	2004
954	919	5	2001
955	141	5	2003
956	142	5	2012
957	920	5	2011
958	921	5	2008
959	922	5	2009
960	197	5	2001
961	199	5	2012
962	721	5	2003
963	923	5	2004
964	924	5	2009
965	216	5	2009
966	265	5	2009
967	925	5	2000
968	926	5	2008
969	927	5	2009
970	730	5	2012
971	928	5	2010
972	929	5	2006
973	669	5	2003
974	930	5	2009
975	357	5	2010
976	365	5	2008
977	366	5	2007
978	367	5	2006
979	369	5	2011
980	931	5	2009
981	932	5	2012
982	933	5	2008
983	934	5	2005
984	935	5	2003
985	936	5	2007
986	937	5	2008
987	938	5	2012
988	671	5	2005
989	939	5	2007
990	940	5	2005
991	672	5	2010
992	941	5	2004
993	942	5	2005
994	405	5	2010
995	407	5	2004
996	943	5	2006
997	944	5	2011
998	945	5	2011
999	946	5	2011
1000	947	5	2006
1001	758	5	2001
1002	415	5	2006
1003	948	5	2003
1004	421	5	2000
1005	764	5	2003
1006	949	5	2006
1007	427	5	2004
1008	950	5	2010
1009	429	5	2004
1010	951	5	2007
1011	435	5	2011
1012	769	5	2012
1013	771	5	2007
1014	775	5	2007
1015	7	5	2001
1016	952	5	2008
1017	777	5	2005
1018	953	5	2004
1019	445	5	2000
1020	520	5	2001
1021	524	5	2011
1022	954	5	2010
1023	955	5	2011
1024	956	5	2012
1025	525	5	2004
1026	957	5	2010
1027	958	5	2005
1028	959	5	2006
1029	526	5	2012
1030	312	5	2010
1031	960	5	2007
1032	961	5	2009
1033	962	5	2007
1034	803	5	2011
1035	963	5	2006
1036	964	5	2008
1037	965	5	2005
1038	580	5	2003
1039	966	5	2009
1040	967	5	2003
1041	363	5	2005
1042	968	5	2003
1043	969	5	2011
1044	970	5	2008
1045	971	5	2009
1046	530	5	2006
1047	972	5	2005
1048	973	5	2007
1049	974	5	2012
1050	975	5	2006
1051	976	5	2007
1052	977	5	2010
1053	143	5	2008
1054	335	5	2005
1055	827	5	2008
1056	532	5	2001
1057	831	5	2004
1058	978	5	2012
1059	169	5	2004
1060	648	5	2010
1061	979	5	2000
1062	980	5	2000
1063	981	5	2000
1064	982	5	2000
1065	983	5	2001
1066	984	5	2001
1067	985	5	2001
1068	986	5	2000
1069	987	5	2000
1070	988	5	2000
\.


--
-- Name: books_awards_book_award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('books_awards_book_award_id_seq', 1070, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('books_book_id_seq', 988, true);


--
-- Data for Name: books_genres; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY books_genres (book_genre_id, book_id, genre_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	11	1
12	12	1
13	13	1
14	14	1
15	15	1
16	16	1
17	17	1
18	18	1
19	19	1
20	20	1
21	21	1
22	22	1
23	23	1
24	24	1
25	25	1
26	26	1
27	27	1
28	28	1
29	29	1
30	30	1
31	31	1
32	32	1
33	33	1
34	34	1
35	35	1
36	36	1
37	37	1
38	38	1
39	39	1
40	40	1
41	41	1
42	42	1
43	43	1
44	44	1
45	45	1
46	46	1
47	47	1
48	48	1
49	49	1
50	50	1
51	51	1
52	52	1
53	53	1
54	54	1
55	55	1
56	56	1
57	57	1
58	58	1
59	59	1
60	60	1
61	61	1
62	62	1
63	63	1
64	64	1
65	65	1
66	66	1
67	67	1
68	68	1
69	69	1
70	70	1
71	71	1
72	72	2
73	73	2
74	74	2
75	75	2
76	76	2
77	77	2
78	78	2
79	79	2
80	80	2
81	81	2
82	82	2
83	83	2
84	84	2
85	85	2
86	86	2
87	87	2
88	88	2
89	89	2
90	90	2
91	91	2
92	92	2
93	93	2
94	94	2
95	95	2
96	96	2
97	97	2
98	98	2
99	99	2
100	100	2
101	101	2
102	102	2
103	103	2
104	104	2
105	105	2
106	106	2
107	107	2
108	108	2
109	109	2
110	110	2
111	111	2
112	112	2
113	113	2
114	114	2
115	115	2
116	116	2
117	117	2
118	118	2
119	119	2
120	120	2
121	121	2
122	122	2
123	123	2
124	124	2
125	125	2
126	126	2
127	127	2
128	128	2
129	129	2
130	130	2
131	131	2
132	132	2
133	133	2
134	134	2
135	135	2
136	136	2
137	137	2
138	138	2
139	139	2
140	140	2
141	141	2
142	142	2
143	143	2
144	144	3
145	145	3
146	146	3
147	147	3
148	148	3
149	149	3
150	150	3
151	151	3
152	152	3
153	153	3
154	154	3
155	155	3
156	156	3
157	157	3
158	158	3
159	159	3
160	160	3
161	161	3
162	162	3
163	163	3
164	164	3
165	165	3
166	166	3
167	167	3
168	168	3
169	169	3
170	170	3
171	171	3
172	172	3
173	173	3
174	174	3
175	175	3
176	176	3
177	177	3
178	178	3
179	179	3
180	180	3
181	181	3
182	182	3
183	183	3
184	184	3
185	185	3
186	186	3
187	187	3
188	188	3
189	189	3
190	190	3
191	191	3
192	192	3
193	193	3
194	194	3
195	195	3
196	196	3
197	1	3
198	197	3
199	198	3
200	199	3
201	2	3
202	200	3
203	201	3
204	202	3
205	203	3
206	204	3
207	205	3
208	206	3
209	207	3
210	208	3
211	209	3
212	210	3
213	211	3
214	212	3
215	213	3
216	214	3
217	215	3
218	216	3
219	217	3
220	218	3
221	219	3
222	220	3
223	221	3
224	222	3
225	223	3
226	224	3
227	225	3
228	226	3
229	227	3
230	228	3
231	229	3
232	230	3
233	231	3
234	232	3
235	233	3
236	234	3
237	235	3
238	236	3
239	237	3
240	238	3
241	239	3
242	240	3
243	241	3
244	242	3
245	243	3
246	244	3
247	245	3
248	246	3
249	247	3
250	248	3
251	249	3
252	250	3
253	251	3
254	252	3
255	253	3
256	254	3
257	255	3
258	256	3
259	257	3
260	258	3
261	259	3
262	260	3
263	261	3
264	262	3
265	263	3
266	264	3
267	265	3
268	266	3
269	267	3
270	268	3
271	269	3
272	270	3
273	271	3
274	272	3
275	273	3
276	274	3
277	275	3
278	276	3
279	277	3
280	278	3
281	279	3
282	280	3
283	281	3
284	282	3
285	283	3
286	284	3
287	285	3
288	286	3
289	287	3
290	288	3
291	289	3
292	290	3
293	291	3
294	292	3
295	293	3
296	294	3
297	295	3
298	296	3
299	297	3
300	298	3
301	299	3
302	300	3
303	301	3
304	302	3
305	303	3
306	304	3
307	305	3
308	306	3
309	307	3
310	308	3
311	309	3
312	310	3
313	311	3
314	312	3
315	313	3
316	314	3
317	315	3
318	316	3
319	317	3
320	318	3
321	319	3
322	320	3
323	321	3
324	322	3
325	323	3
326	324	3
327	325	3
328	326	3
329	327	3
330	328	3
331	329	3
332	330	3
333	331	3
334	332	3
335	333	3
336	334	3
337	335	3
338	336	3
339	337	3
340	338	3
341	339	3
342	340	3
343	341	3
344	342	3
345	343	3
346	344	3
347	345	3
348	346	3
349	347	3
350	348	3
351	349	3
352	350	3
353	351	3
354	352	3
355	353	3
356	354	3
357	355	3
358	356	3
359	357	3
360	358	3
361	359	3
362	360	3
363	361	3
364	362	4
365	363	4
366	364	4
367	365	4
368	366	4
369	367	4
370	368	4
371	369	4
372	370	4
373	371	4
374	372	4
375	373	4
376	374	4
377	375	4
378	376	4
379	377	4
380	378	4
381	379	4
382	380	4
383	381	4
384	382	4
385	383	4
386	384	4
387	385	4
388	386	4
389	387	4
390	388	4
391	389	4
392	390	4
393	391	4
394	392	4
395	393	4
396	394	4
397	395	4
398	396	4
399	397	4
400	398	4
401	399	4
402	400	4
403	401	4
404	402	4
405	403	4
406	404	4
407	405	4
408	406	4
409	407	4
410	408	4
411	409	4
412	410	4
413	411	4
414	412	4
415	413	4
416	414	4
417	415	4
418	416	4
419	417	4
420	418	4
421	419	4
422	420	4
423	421	4
424	422	4
425	423	4
426	424	4
427	425	4
428	426	4
429	427	4
430	428	4
431	429	4
432	430	4
433	431	4
434	432	4
435	433	4
436	434	4
437	435	4
438	436	4
439	437	4
440	438	4
441	439	4
442	440	4
443	441	4
444	442	4
445	7	4
446	443	4
447	444	4
448	8	4
449	445	4
450	446	4
451	447	4
452	448	4
453	449	4
454	450	4
455	451	4
456	452	4
457	453	4
458	454	4
459	455	4
460	456	4
461	457	4
462	458	4
463	459	4
464	460	4
465	461	4
466	462	4
467	463	4
468	464	4
469	465	4
470	466	4
471	467	4
472	468	4
473	469	4
474	470	4
475	471	4
476	472	4
477	473	4
478	474	4
479	475	4
480	476	4
481	477	4
482	478	4
483	479	4
484	480	4
485	481	4
486	482	4
487	483	4
488	484	4
489	485	4
490	486	4
491	487	4
492	488	4
493	489	4
494	490	4
495	491	4
496	492	4
497	493	4
498	494	4
499	495	4
500	496	4
501	497	4
502	498	4
503	499	4
504	500	4
505	501	4
506	502	4
507	503	4
508	504	4
509	505	4
510	506	4
511	507	4
512	508	4
513	509	4
514	510	4
515	511	4
516	512	4
517	513	4
518	514	4
519	515	4
520	516	4
521	517	4
522	518	4
523	519	4
524	520	4
525	521	4
526	522	4
527	523	4
528	524	4
529	525	4
530	526	4
531	527	4
532	528	4
533	529	4
534	530	4
535	531	4
536	532	4
537	533	5
538	534	5
539	535	5
540	536	5
541	537	5
542	538	5
543	539	5
544	540	5
545	541	5
546	542	5
547	543	5
548	544	5
549	545	6
550	546	6
551	547	6
552	548	6
553	549	6
554	550	6
555	551	6
556	552	6
557	553	6
558	554	6
559	555	6
560	556	6
561	557	6
562	558	6
563	559	6
564	560	6
565	561	6
566	562	6
567	563	6
568	564	6
569	565	6
570	566	6
571	567	6
572	568	6
573	569	6
574	570	6
575	571	6
576	572	6
577	573	6
578	574	6
579	575	6
580	576	6
581	577	6
582	578	6
583	579	6
584	580	6
585	581	6
586	582	6
587	583	6
588	584	6
589	585	6
590	586	6
591	587	6
592	588	6
593	589	6
594	590	6
595	591	6
596	592	6
597	593	6
598	594	6
599	595	6
600	596	6
601	597	6
602	598	6
603	599	6
604	600	6
605	601	6
606	602	6
607	603	6
608	604	6
609	605	6
610	606	6
611	607	6
612	608	6
613	609	6
614	610	6
615	611	6
616	612	6
617	613	6
618	614	6
619	615	6
620	616	6
621	617	6
622	618	6
623	619	7
624	620	7
625	621	7
626	622	7
627	623	7
628	624	7
629	625	7
630	626	7
631	627	7
632	628	7
633	629	7
634	630	7
635	631	7
636	632	7
637	633	7
638	634	7
639	635	7
640	636	7
641	637	7
642	638	7
643	639	7
644	640	7
645	641	7
646	642	7
647	643	7
648	644	7
649	645	7
650	646	7
651	647	7
652	648	7
653	649	7
654	650	7
655	651	7
656	652	7
657	653	7
658	654	7
659	655	7
660	656	7
661	657	7
662	658	7
663	659	7
664	660	7
665	661	7
666	662	7
667	663	7
668	664	7
669	665	7
670	666	7
671	667	7
672	199	7
673	668	7
674	669	7
675	354	7
676	356	7
677	370	7
678	670	7
679	395	7
680	671	7
681	398	7
682	402	7
683	672	7
684	416	7
685	418	7
686	424	7
687	673	7
688	427	7
689	431	7
690	446	7
691	674	7
692	675	7
693	676	7
694	677	7
695	678	7
696	679	7
697	680	7
698	681	7
699	682	7
700	683	7
701	684	7
702	685	7
703	686	7
704	687	7
705	688	7
706	689	7
707	690	7
708	691	7
709	692	7
710	693	7
711	694	7
712	404	7
713	695	7
714	696	7
715	697	7
716	698	7
717	699	7
718	700	7
719	701	7
720	702	7
721	703	7
722	704	7
723	705	7
724	706	7
725	707	7
726	708	7
727	709	7
728	710	7
729	711	7
730	712	7
731	713	7
732	714	7
733	715	7
734	716	7
735	717	7
736	718	7
737	719	7
738	90	7
739	142	7
740	720	7
741	721	7
742	722	7
743	723	7
744	724	7
745	725	7
746	726	7
747	727	7
748	248	7
749	300	7
750	301	7
751	302	7
752	728	7
753	729	7
754	730	7
755	349	7
756	731	7
757	732	7
758	733	7
759	734	7
760	735	7
761	736	7
762	365	7
763	737	7
764	738	7
765	739	7
766	740	7
767	741	7
768	742	7
769	743	7
770	744	7
771	388	7
772	745	7
773	746	7
774	747	7
775	748	7
776	749	7
777	750	7
778	751	7
779	752	7
780	753	7
781	754	7
782	755	7
783	756	7
784	757	7
785	758	7
786	759	7
787	760	7
788	761	7
789	762	7
790	419	7
791	763	7
792	764	7
793	765	7
794	425	7
795	766	7
796	767	7
797	768	7
798	435	7
799	769	7
800	770	7
801	771	7
802	772	7
803	773	7
804	774	7
805	775	7
806	776	7
807	777	7
808	778	7
809	523	7
810	779	7
811	780	7
812	781	7
813	782	7
814	783	7
815	784	7
816	785	7
817	786	7
818	787	7
819	788	7
820	789	7
821	790	7
822	791	7
823	792	7
824	793	7
825	794	7
826	795	7
827	796	7
828	797	7
829	798	7
830	799	7
831	800	7
832	801	7
833	802	7
834	803	7
835	804	7
836	805	7
837	806	7
838	807	7
839	808	7
840	809	7
841	810	7
842	811	7
843	812	7
844	813	7
845	814	7
846	815	7
847	816	7
848	817	7
849	818	7
850	819	7
851	820	7
852	821	7
853	530	7
854	822	7
855	823	7
856	824	7
857	825	7
858	826	7
859	335	7
860	827	7
861	828	7
862	829	7
863	830	7
864	831	7
865	832	7
866	169	7
867	833	7
868	834	7
869	835	7
870	836	7
871	837	7
872	838	7
873	839	7
874	840	7
875	841	7
876	842	7
877	843	7
878	844	7
879	845	7
880	846	7
881	847	7
882	848	7
883	849	7
884	850	7
885	851	7
886	852	7
887	853	7
888	854	7
889	855	7
890	856	7
891	857	7
892	858	7
893	859	7
894	860	7
895	861	7
896	862	7
897	863	7
898	864	7
899	865	7
900	866	7
901	867	7
902	868	7
903	869	7
904	870	7
905	871	7
906	872	7
907	873	7
908	874	7
909	875	7
910	876	7
911	877	7
912	878	7
913	879	7
914	880	7
915	881	7
916	882	7
917	883	7
918	884	7
919	885	7
920	886	7
921	887	7
922	888	7
923	889	7
924	890	7
925	891	7
926	892	7
927	893	7
928	894	7
929	895	7
930	896	7
931	897	7
932	898	8
933	899	8
934	900	8
935	901	8
936	902	8
937	903	8
938	904	8
939	905	8
940	906	8
941	907	8
942	908	8
943	909	8
944	910	8
945	911	8
946	912	8
947	913	8
948	914	8
949	915	8
950	916	8
951	917	8
952	918	8
953	919	8
954	141	8
955	142	8
956	920	8
957	921	8
958	922	8
959	197	8
960	199	8
961	721	8
962	923	8
963	924	8
964	216	8
965	265	8
966	925	8
967	926	8
968	927	8
969	730	8
970	928	8
971	929	8
972	669	8
973	930	8
974	357	8
975	365	8
976	366	8
977	367	8
978	369	8
979	931	8
980	932	8
981	933	8
982	934	8
983	935	8
984	936	8
985	937	8
986	938	8
987	671	8
988	939	8
989	940	8
990	672	8
991	941	8
992	942	8
993	405	8
994	407	8
995	943	8
996	944	8
997	945	8
998	946	8
999	947	8
1000	758	8
1001	415	8
1002	948	8
1003	421	8
1004	764	8
1005	949	8
1006	427	8
1007	950	8
1008	429	8
1009	951	8
1010	435	8
1011	769	8
1012	771	8
1013	775	8
1014	7	8
1015	952	8
1016	777	8
1017	953	8
1018	445	8
1019	520	8
1020	524	8
1021	954	8
1022	955	8
1023	956	8
1024	525	8
1025	957	8
1026	958	8
1027	959	8
1028	526	8
1029	312	8
1030	960	8
1031	961	8
1032	962	8
1033	803	8
1034	963	8
1035	964	8
1036	965	8
1037	580	8
1038	966	8
1039	967	8
1040	363	8
1041	968	8
1042	969	8
1043	970	8
1044	971	8
1045	530	8
1046	972	8
1047	973	8
1048	974	8
1049	975	8
1050	976	8
1051	977	8
1052	143	8
1053	335	8
1054	827	8
1055	532	8
1056	831	8
1057	978	8
1058	169	8
1059	648	8
1060	979	8
1061	980	8
1062	981	8
1063	982	8
1064	983	8
1065	984	8
1066	985	8
1067	986	8
1068	987	8
1069	988	8
\.


--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('books_genres_book_genre_id_seq', 1069, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: Henry
--

COPY genres (genre_id, genre) FROM stdin;
1	Fiction
2	Nonfiction
3	Economics and Business
4	Poetry
5	Philosophy
6	Politics and Current Affairs
7	Science and Technology
8	Young people's Literature
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Henry
--

SELECT pg_catalog.setval('genres_genre_id_seq', 8, true);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: awards_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (award_id);


--
-- Name: books_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_authors
    ADD CONSTRAINT books_authors_pkey PRIMARY KEY (book_author_id);


--
-- Name: books_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_awards
    ADD CONSTRAINT books_awards_pkey PRIMARY KEY (book_award_id);


--
-- Name: books_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_pkey PRIMARY KEY (book_genre_id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: books_authors_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_authors
    ADD CONSTRAINT books_authors_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(author_id);


--
-- Name: books_authors_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_authors
    ADD CONSTRAINT books_authors_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: books_awards_award_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_awards
    ADD CONSTRAINT books_awards_award_id_fkey FOREIGN KEY (award_id) REFERENCES awards(award_id);


--
-- Name: books_awards_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_awards
    ADD CONSTRAINT books_awards_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: books_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: books_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Henry
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

